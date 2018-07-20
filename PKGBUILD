# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=hexalate
pkgver=1.1.4
pkgrel=1
pkgdesc='A color matching game'
arch=('i686' 'x86_64')
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('9dfdaaf802f792dbd539b7e87674f942a773970aa50c298cd395b5d21a9acca3')

build() {
  cd "$pkgname-$pkgver"

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir/" install
}
