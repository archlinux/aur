# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=peg-e
pkgver=1.2.1
pkgrel=1
pkgdesc='Peg elimination game'
arch=('i686' 'x86_64')
url="http://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt5-base')
install="$pkgname.install"
source=("http://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('bf96ad7e84f3244f614ccf08c1dbc4f1bdae4bb2cc362a99ecee322ee7e38635')

build() {
  cd "$pkgname-$pkgver"

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir/" install
}
