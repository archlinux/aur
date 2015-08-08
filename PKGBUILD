# Maintainer: megadriver <megadriver at gmx dot com>
# Contributor: Lucas de Sena <lucas DOT ta23 @ gmail DOT com>
# Contributor: Alexandre Dantas <eu @ alexdantas DOT net>

pkgname=yetris
pkgver=2.3.0
pkgrel=2
pkgdesc="Customizable Tetris clone for the terminal"
arch=('x86_64' 'i686')
url="http://yetris.alexdantas.net/"
license=('GPL3')
depends=('ncurses')
source=(https://github.com/alexdantas/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('2a503ccfc91c99910d53659dbfc14c5c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

