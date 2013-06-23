# Maintainer: jjacky
pkgname=pacdep
pkgver=1.1.0
pkgrel=1
pkgdesc="Package Dependencies listing"
arch=('i686' 'x86_64')
url="http://jjacky.com/pacdep"
license=('GPL3+')
depends=('pacman>=4.1' 'pacman<4.2')
makedepends=('perl' 'groff')
source=(http://jjacky.com/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('4c416189360ad48320383a5720d51f19')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
