# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=tanglet
pkgver=1.6.1
pkgrel=1
pkgdesc='A single player word finding game'
arch=('x86_64')
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt6-base')
makedepends=('cmake' 'qt6-tools')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('4ffa954b7e27988b0f025d99d95fecda59cf1ae29b56239ab250370b3ad62b0b')

build() {
  cmake -B build -S $pkgbase-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
