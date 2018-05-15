# Maintainer: FFY00 (filippe.lains@gmail.com)

_target=$CARCH-unknown-linux-gnu
_gccver=6.3.0
_dver=2.068.2

pkgname=('gdc-bin' 'libgphobos-lib32') # gcc, libgphobos
pkgver=$_gccver+$_dver
pkgrel=1
arch=('i686' 'x86_64')
url="https://gdcproject.org/"
license=('GPL')
source_i686=("http://gdcproject.org/downloads/binaries/$_gccver/i686-linux-gnu/gdc-$pkgver.tar.xz")
source_x86_64=("http://gdcproject.org/downloads/binaries/$_gccver/x86_64-linux-gnu/gdc-$pkgver.tar.xz")
md5sums_i686=('cc8dcd66b189245e39296b1382d0dfcc')
md5sums_x86_64=('16d3067ebb3938dba46429a4d9f6178f')

package_gdc-bin() {
	depends=("gcc=$_gccver" 'perl' 'binutils' 'libgphobos')
	provides=("d-compiler=_dver" "gdc=$pkgver")
	pkgdesc="Compiler for D programming language which uses gcc backend"

	# compiler
	install -D -m755 $srcdir/$_target/bin/gdc $pkgdir/usr/bin/gdc
	install -D -m755 $srcdir/$_target/libexec/gcc/$_target/$_gccver/cc1d $pkgdir/lib/gcc/$CHOST/cc1d

	# tools
	install -D -m755 $srcdir/$_target/bin/gdmd $pkgdir/usr/bin/gdmd
}

#package_gcc() {
#	pkgdesc="The GNU Compiler Collection - C and C++ frontends"
#	provides=("gcc=$_gccver" "gcc-libs=$_gccver")
#	
#	install -D -m755 $srcdir/$_target/bin/gcc $pkgdir/usr/bin/gcc-$_gccver
#	install -d -m644 $pkgdir/include/c++/$_gccver
#	cp -dr --no-preserve=ownership $srcdir/$_target/include/c++/$_gccver $pkgdir/include/c++/$_gccver
#	install -d -m644 $pkgdir/lib/gcc/$CHOST/$_gccver
#	cp -dr --no-preserve=ownership $srcdir/$_target/lib/gcc/$_target/$_gccver $pkgdir/lib/gcc/$CHOST/$_gccver
#	install -d -m644 $pkgdir/libexec/gcc/$CHOST/$_gccver
#	cp -dr --no-preserve=ownership $srcdir/$_target/libexec/gcc/$_target/$_gccver $pkgdir/libexec/gcc/$CHOST/$_gccver
#}

#package_libgphobos() {
#	pkgdesc="Standard library for D programming language, GDC port"
#	provides=("d-runtime" "d-stdlib")
#	
#	install -D -m644 $srcdir/$_target/lib64/libgphobos.so $pkgdir/usr/lib/libgphobos.so
#	install -D -m644 $srcdir/$_target/lib64/libgphobos.so $pkgdir/usr/lib/libgphobos.so.68
#	install -D -m644 $srcdir/$_target/lib64/libgphobos.so $pkgdir/usr/lib/libgphobos.so.68.0.2
#	install -D -m644 $srcdir/$_target/lib64/libgphobos.so $pkgdir/usr/lib/libgphobos.spec
#	install -D -m644 $srcdir/$_target/lib64/libgphobos.so $pkgdir/usr/lib/libgphobos.a
#	install -D -m644 $srcdir/$_target/lib64/libgphobos.so $pkgdir/usr/lib/libgphobos.la
#}

package_libgphobos-lib32() {
	pkgdesc="Standard library for D programming language, GDC port"
	provides=("d-runtime-lib32" "d-stdlib-lib32")
	
	install -D -m644 $srcdir/$_target/lib32/libgphobos.so $pkgdir/usr/lib/libgphobos.so
	install -D -m644 $srcdir/$_target/lib32/libgphobos.so $pkgdir/usr/lib/libgphobos.so.68
	install -D -m644 $srcdir/$_target/lib32/libgphobos.so $pkgdir/usr/lib/libgphobos.so.68.0.2
	install -D -m644 $srcdir/$_target/lib32/libgphobos.so $pkgdir/usr/lib/libgphobos.spec
	install -D -m644 $srcdir/$_target/lib32/libgphobos.so $pkgdir/usr/lib/libgphobos.a
	install -D -m644 $srcdir/$_target/lib32/libgphobos.so $pkgdir/usr/lib/libgphobos.la
}
