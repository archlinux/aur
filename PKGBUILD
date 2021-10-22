# Maintainer: Sylvain POULAIN <sylvain at giscan dot com>
# Maintainer: Justin R. St-Amant <jstamant24 at gmail dot com>
# Contributor: Samuel Mesa <samuelmesa@linuxmail.org>

pkgname=dxflib
pkgver=3.26.4
pkgrel=1
pkgdesc="Open source C++ library mainly for parsing DXF files"
arch=("x86_64" "i686")
url="http://www.ribbonsoft.com/en/what-is-dxflib"
license=('GPL')
source=("https://qcad.org/archives/$pkgname/$pkgname-$pkgver-src.tar.gz")
md5sums=('70f23a9d2ed64d4f039aef1fb2109d11')

build() {
  cd "$srcdir/$pkgname-$pkgver-src"

  qmake dxflib.pro
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver-src"

  mkdir -p ${pkgdir}/usr/{lib,include}
  cp *.o libdxflib.a ${pkgdir}/usr/lib/
  cp -rfv  src ${pkgdir}/usr/include/dxflib
}
