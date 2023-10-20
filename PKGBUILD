# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kio-stash
pkgver=1.0
pkgrel=2
pkgdesc='A kio slave and daemon to stash discontinuous file selections'
arch=(x86_64)
url="https://www.kde.org/"
license=(GPL2)
depends=(gcc-libs
         glibc
         kcoreaddons5
         kdbusaddons5
         kio5
         qt5-base)
makedepends=(extra-cmake-modules)
source=(https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('d8ef422924e24317122524fb1d1e439d45ff9281a502a6258a782cfe0d8c8eaa')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
