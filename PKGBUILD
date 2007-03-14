# Contributor: Olivier Mehani <olivier.mehani@inria.fr>
# $Id$

_archivename=glibc
_target=mipsel-linux
pkgname=$_target-${_archivename}3
pkgver=2.3.3
pkgrel=1
pkgdesc="mipsel-linux GNU C Library"
url="http://www.gnu.org/software/$_archivename/"
makedepends=($_target-binutils $_target-gcc)
source=(ftp://ftp.gnu.org/gnu/$_archivename/$_archivename-$pkgver.tar.bz2)
md5sums=('e825807b98042f807799ccc9dd96d31b')

build() {
	cd $startdir/src/$_archivename-$pkgver
	mkdir build
	cd build
	../configure --target=$_target --prefix=/usr/$_target $_target || return 1
	make || return 2
	make install || return 3
}
