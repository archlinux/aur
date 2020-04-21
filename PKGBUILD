# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=tetzle
pkgver=2.1.6
pkgrel=1
pkgdesc='A tetromino jigsaw puzzle game'
arch=('i686' 'x86_64')
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('fbc3c86b5bf64187f89379176bd0085c636605d9594c7af8d0c056760d6cf80a')

build() {
  cd "$pkgname-$pkgver"

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir/" install
}
