# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kgeotag
pkgver=1.3.0
pkgrel=1
pkgdesc='Photo geotagging program'
arch=(x86_64)
url='https://kgeotag.kde.org/'
license=(GPL)
depends=(kxmlgui libkexiv2 marble-common)
makedepends=(extra-cmake-modules kdoctools)
source=(https://download.kde.org/stable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('706c987e2521136ad48ca22f28d3c5d95dd674dd7e6ffd36445cf943cb4ede87'
            'SKIP')
validpgpkeys=(A53563BC888E6CE5215535992523842AF9681DDF) # Tobias Leupold <tobias.leupold@gmx.de>

build() {
  cmake -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
