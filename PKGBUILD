# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=arcus
pkgver=15.06.03
pkgrel=1
pkgdesc="Communication library between internal components for Ultimaker software"
url="https://github.com/Ultimaker/libArcus"
arch=('i686' 'x86_64')
license=('GPLv3')
makedepends=('cmake')
depends=('protobuf-ultimaker')
source=(https://github.com/Ultimaker/libArcus/archive/${pkgver}.tar.gz)
md5sums=('c61fafaa82f71cef5e0f6780688f853e')

build() {
  cd libArcus-${pkgver}
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd libArcus-${pkgver}/build
  make DESTDIR="${pkgdir}" install
  mv ${pkgdir}/usr/lib64  ${pkgdir}/usr/lib
  #install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
