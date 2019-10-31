# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: megadriver <megadriver at gmx dot com>
# Contributor: Lucas de Sena <lucas DOT ta23 @ gmail DOT com>
# Contributor: Alexandre Dantas <eu @ alexdantas DOT net>
pkgname=yetris
pkgver=2.3.0
pkgrel=3
pkgdesc='Customizable Tetris clone for the terminal'
arch=('x86_64' 'i686')
url='https://github.com/alexdantas/yetris'
license=('GPL3')
depends=('ncurses')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alexdantas/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('720c222325361e855e2dcfec34f8f0ae61dd418867a87f7af03c9a59d723b919')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
