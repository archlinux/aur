# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=hexalate
pkgver=1.0.3
pkgrel=1
pkgdesc='A color matching game'
arch=('i686' 'x86_64')
url="http://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt5-base')
install="$pkgname.install"
source=("http://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('a391ba44aa0f5bd618385dbe17e059947b829b85315aecb19edd1c863b3ebe3c')

build() {
  cd "$pkgname-$pkgver"

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir/" install
}
