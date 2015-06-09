# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=tetzle
pkgver=2.0.3
pkgrel=3
pkgdesc='A tetromino jigsaw puzzle game'
arch=('i686' 'x86_64')
url="http://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt4')
optdepends=('jhead: auto-orient images')
install="$pkgname.install"
source=("http://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('6c29ea61501dcc0149ece879217df5710d1169bfae940a667af2a19605415b51')

build() {
  cd "$pkgname-$pkgver"

  qmake-qt4 PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir/" install
}
