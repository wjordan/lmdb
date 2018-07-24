require 'mkmf'

$CFLAGS = '-std=c99 -Wall -g'

# Always embed lmdb for consistency.
lib = 'liblmdb/libraries/liblmdb'
$INCFLAGS << " -I$(srcdir)/#{lib}"
$VPATH ||= []
$VPATH << "$(srcdir)/#{lib}"
$srcs = %w[
  mdb.c
  midl.c
  lmdb_ext.c
]

have_header 'limits.h'
have_header 'string.h'
have_header 'stdlib.h'
have_header 'errno.h'
have_header 'sys/types.h'
have_header 'assert.h'

have_header 'ruby.h'
have_func 'rb_funcall_passing_block'
have_func 'rb_thread_call_without_gvl2'

create_header

create_makefile('lmdb_ext')
