# Maintainer: jjacky
pkgname=pacdep
pkgver=0.1.0
pkgrel=2
pkgdesc="Package Dependencies listing"
arch=('i686' 'x86_64')
url="https://github.com/jjk-jacky/pacdep"
license=('GPL3+')
depends=('pacman>=4.0.1' 'pacman<4.1')
makedepends=('perl' 'groff')
source=(https://github.com/downloads/jjk-jacky/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('8dc22dd83097eae1fb731e8b8e9210b0')

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
