# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=keurocalc
pkgver=1.3.0
pkgrel=1
pkgdesc="Utility to handle currency conversions between European currencies"
arch=(x86_64)
url="https://kde.org/applications/office/org.kde.keurocalc"
license=(GPL2)
depends=(kio hicolor-icon-theme)
makedepends=(extra-cmake-modules kdoctools)
source=("https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('964a9b358f77658b9776226c519b7aa10610fd6d8cdd8c53b8439a22cb93812a')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
