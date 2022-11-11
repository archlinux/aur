# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: M0Rf30
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=colord-kde
pkgver=0.5.0
pkgrel=3
pkgdesc="Interfaces and session daemon to colord for KDE"
arch=(x86_64)
url='https://userbase.kde.org/Color_Management'
license=(GPL)
depends=(colord libxrandr kservice kconfigwidgets)
makedepends=(extra-cmake-modules plasma-framework kcmutils kitemviews)
source=("https://download.kde.org/stable/colord-kde/$pkgver/src/$pkgname-$pkgver.tar.xz")
md5sums=('4833ffdf73cc795195e1c82eaf0de51e')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  build
  make DESTDIR="$pkgdir" install
}
