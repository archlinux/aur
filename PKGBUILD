# Maintainer:
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=libkvkontakte
pkgver=5.0.0
pkgrel=3
pkgdesc="C++ library for asynchronous interaction with VK social network via its web API"
arch=(x86_64)
url='https://www.digikam.org'
license=(GPL)
depends=(kdewebkit)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('00f11a13e1c3c10c7abd53b300237a9b7ab5c9b3b80e0381e01993e82c768193'
            'SKIP')
validpgpkeys=(7C35920F1CE2899E8EA9AAD02E7C0367B9BFA089) # Scarlett Clark <sgclark@kde.org>

prepare() {
  mkdir -p build 
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
