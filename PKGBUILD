# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kgeotag
pkgver=1.5.0
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
         libkexiv2
         marble-common
         qt5-base
         xdg-utils)
makedepends=(extra-cmake-modules
             kdoctools5)
source=(https://download.kde.org/stable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('684864ac61a32ec9c4cc645f89d15e7bce5930e96a7784a40c7eed0db555fa2a'
            'SKIP')
validpgpkeys=(A53563BC888E6CE5215535992523842AF9681DDF) # Tobias Leupold <tobias.leupold@gmx.de>

build() {
  cmake -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
