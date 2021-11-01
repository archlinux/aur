# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=skanpage
pkgver=1.0.0
pkgrel=1
pkgdesc='Photo geotagging program'
arch=(x86_64)
url='https://apps.kde.org/es/skanpage/'
license=(GPL)
depends=(libksane kirigami2 kcrash)
makedepends=(extra-cmake-modules)
source=(https://download.kde.org/stable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz) # {,.sig})
sha256sums=('90f5401bae283e4285df3b4707857b336c5cd4072fc221e762930c2cc40d6060')

build() {
  cmake -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
