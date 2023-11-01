# Maintainer: CJlano <cjlano+aur.eliot - free.fr>
pkgname=eliot
pkgver=2.2
pkgrel=1
pkgdesc="An open source Scrabble game"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/eliot/"
license=('GPL')
depends=('arabica' 'libconfig' 'qt4')
makedepends=('boost')
install="$pkgname.install"
source=(https://download.savannah.nongnu.org/releases/eliot/releases/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('5f1a07e0b000a6f69593cb9eb0acc435')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
