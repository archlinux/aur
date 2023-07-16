# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=libkipi
pkgver=23.04.3
pkgrel=1
pkgdesc='An interface to use kipi-plugins from a KDE application'
url='https://www.kde.org/'
arch=($CARCH)
license=(GPL LGPL FDL)
depends=(kxmlgui kservice hicolor-icon-theme)
makedepends=(extra-cmake-modules)
source=("$pkgname-$pkgver.tar.gz::https://github.com/KDE/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('64f4cfacdc6c63814e1f30842aa5cd993979eeabd9d21ced94bfbf8f2507651a')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
