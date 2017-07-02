# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=tanglet
pkgver=1.4.0
pkgrel=3
pkgdesc='A single player word finding game'
arch=('i686' 'x86_64')
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('b2b211f1576a8a4a1c314294fcae931ca0b62eec43b85308ce44fe5c5725b805')

build() {
  cd "$pkgname-$pkgver"

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  qmake-qt5 PREFIX=/usr
  make INSTALL_ROOT="$pkgdir/" install
}
