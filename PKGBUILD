# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kgeotag
pkgver=1.6.0
pkgrel=1
pkgdesc='Photo geotagging program'
arch=(x86_64)
url='https://kgeotag.kde.org/'
license=(GPL)
depends=(gcc-libs
         glibc
         kconfig5
         kconfigwidgets5
         kcoreaddons5
         kcrash5
         ki18n5
         kxmlgui5
         libkexiv2-qt5
         marble-common
         qt5-base
         xdg-utils)
makedepends=(extra-cmake-modules
             kdoctools5)
source=(https://download.kde.org/stable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('131fec1a99a200858da4371989af1649bd2a9e974beb1c9feef19164aac5afeb'
            'SKIP')
validpgpkeys=(F277636BA2E409347D503411CAA57B280FE0E9EE) # Tobias Leupold <tobias.leupold@gmx.de>

build() {
  cmake -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
