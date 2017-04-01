# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kbackgammon
pkgver=0.18
_pkgver=018
pkgrel=3
pkgdesc="Backgammon game for KDE"
arch=(i686 x86_64)
url="https://www.linux-apps.com/content/show.php/KBackgammon?content=142680"
license=(GPL)
depends=(kdebase-runtime libkdegames4)
makedepends=(cmake automoc4)
source=("https://dl.opendesktop.org/api/files/download/id/1464969373/142680-backgammon_${pkgver//./}.tar.gz")
sha256sums=('f767aae42e33bd9f68cbf5d956e56de540f36c402925a3a9699c0e00447a979b')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../backgammon -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
