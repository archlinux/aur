# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=hexalate
pkgver=1.2.0
pkgrel=1
pkgdesc='A color matching game'
arch=('x86_64')
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt6-base')
makedepends=('cmake' 'qt6-tools')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('a54aa31c6243ba091f46a6ced17be70e7481cc2af7de94f7e0288864355133bd')

build() {
  cmake -B build -S $pkgbase-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
