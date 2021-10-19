# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kgeotag
pkgver=1.1.0
pkgrel=1
pkgdesc='Photo geotagging program'
arch=(x86_64)
url='https://kgeotag.kde.org/'
license=(GPL)
depends=(kxmlgui libkexiv2 marble-common)
makedepends=(extra-cmake-modules)
source=(https://download.kde.org/stable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('6e6f03711b543ac71ce6f7e2399ddda02733c3fd28a8fdb122987cc1ec0969b7'
            'SKIP')
validpgpkeys=(A53563BC888E6CE5215535992523842AF9681DDF) # Tobias Leupold <tobias.leupold@gmx.de>

build() {
  cmake -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
