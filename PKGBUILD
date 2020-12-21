# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: birdflesh <antkoul at gmail dot com>

pkgname=oxygen-gtk2
pkgver=1.4.6
pkgrel=4
pkgdesc="Port of the default KDE widget theme (Oxygen) to GTK2"
arch=(x86_64)
url='https://projects.kde.org/projects/playground/artwork/oxygen-gtk/'
license=(LGPL)
depends=(gtk2)
makedepends=(cmake)
source=("https://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.bz2")
sha256sums=('a289434347cc96054c75d1e4e4408b84adc2e8c7862f0be4e2da8fafbf26bf26')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
