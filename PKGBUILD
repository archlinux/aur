# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=peg-e
pkgver=1.2.6
pkgrel=1
pkgdesc='Peg elimination game'
arch=('i686' 'x86_64')
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('b7a644397a6e8fd24c5df72a8c5950af8de035c9fafc712fea5eae87eea15d81')

build() {
  cd "$pkgname-$pkgver"

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir/" install
}
