# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kgeotag
pkgver=1.2.0
pkgrel=1
pkgdesc='Photo geotagging program'
arch=(x86_64)
url='https://kgeotag.kde.org/'
license=(GPL)
depends=(kxmlgui libkexiv2 marble-common)
makedepends=(extra-cmake-modules)
source=(https://download.kde.org/stable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('ff99b0a8b1ad1a8a7c127bfe2c86a2d58c7e13b8f89da56ea97286be93624118'
            'SKIP')
validpgpkeys=(A53563BC888E6CE5215535992523842AF9681DDF) # Tobias Leupold <tobias.leupold@gmx.de>

build() {
  cmake -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
