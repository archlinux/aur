# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kipi-plugins
pkgver=23.04.1
pkgrel=2
pkgdesc='A collection of plugins extending the KDE graphics and image applications'
arch=($CARCH)
license=(GPL)
url='https://apps.kde.org/kipi_plugins/'
depends=(kio libkipi)
optdepends=('libmediawiki: MediaWiki Export plugin'
            'qt5-xmlpatterns: rajce.net plugin')
makedepends=(extra-cmake-modules qt5-xmlpatterns libmediawiki)
groups=(kde-applications kde-graphics)
source=("$pkgname-$pkgver.tar.gz::https://github.com/KDE/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('22aad9610595335f5cb146f3fec495f1641819ca8d89dc41d313862dde9a5752')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
