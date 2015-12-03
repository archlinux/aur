# Maintainer: leepesjee <lpeschier at xs4all dot nl>
pkgname=cqrlib
pkgver=1.1.3
pkgrel=1
pkgdesc="an ANSI C library for quaternion arithmetic and rotation math"
arch=('i686' 'x86_64')
url="http://cqrlib.sourceforge.net/"
depends=('glibc') 
license=('LGPL')
source=(http://downloads.sourceforge.net/project/cqrlib/cqrlib/CQRlib-$pkgver/CQRlib-$pkgver.tar.gz)
md5sums=('06838360467ee29a528476c83f58b804')

prepare() {
  cd $srcdir/CQRlib-$pkgver
  sed -i "s|INSTALLDIR  = \$(HOME)|INSTALLDIR = ${pkgdir}/usr|" ./Makefile
}

buid() {
  cd $srcdir/CQRlib-$pkgver
  make clean
  make all
}

package () {
  cd $srcdir/CQRlib-$pkgver
  make install
# do not install the libtool thing
  rm ${pkgdir}/usr/lib/*.la
}
