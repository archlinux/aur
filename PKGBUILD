# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=libkipi
pkgver=23.04.1
pkgrel=2
pkgdesc='An interface to use kipi-plugins from a KDE application'
url='https://www.kde.org/'
arch=($CARCH)
license=(GPL LGPL FDL)
depends=(kxmlgui kservice hicolor-icon-theme)
makedepends=(extra-cmake-modules)
source=("$pkgname-$pkgver.tar.gz::https://github.com/KDE/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2c00e6a9ab5489ac44157a054337bb6fe7152d38ca6010a3ee544bae89b0aca7')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
