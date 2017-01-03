# Maintainer: CJlano <cjlano+aur.eliot - free.fr>
pkgname=eliot
pkgver=2.1
pkgrel=1
pkgdesc="An open source Scrabble game"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/eliot/"
license=('GPL')
depends=('arabica' 'libconfig' 'qt4')

source=(http://dl.sv.nongnu.org/releases-noredirect/$pkgname/releases/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('b00827bfcd64a6cc075357f3b3c34df9')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
