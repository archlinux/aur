# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=cutemaze
pkgver=1.2.0
pkgrel=3
pkgdesc='Top-down maze game'
arch=('i686' 'x86_64')
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt5-base' 'qt5-svg')
makedepends=('qt5-tools')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('d23a0d11a237f53d6b8da9234b5b475bbca8d67abbdd124cfa7c0cb4da70349b')

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
