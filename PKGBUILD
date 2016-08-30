# $Id: PKGBUILD 271834 2016-07-13 17:04:38Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kirigami
pkgver=1.0.2
pkgrel=1
pkgdesc='A QtQuick based components set'
arch=(i686 x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(qt5-declarative)
makedepends=(extra-cmake-modules)
source=("http://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz")
md5sums=('e16e1d34d5ab03db3ea272c603a87898')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
