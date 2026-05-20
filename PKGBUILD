# Maintainer: Peu Borges <148594362+MCookinho@users.noreply.github.com>
# Contributor: Peu Borges <148594362+MCookinho@users.noreply.github.com>

pkgname=shellgame
pkgver=1.1
pkgrel=1
pkgdesc="Terminal Arcade Collection — 25 classic and original games (Snake, Tetris, Pac-Man, Spire Ascent and more)"
arch=('x86_64' 'aarch64')
url="https://github.com/MCookinho/shellgame"
license=('MIT')
depends=('ncurses')
makedepends=('gcc' 'make')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd shellgame-$pkgver
  make
}

check() {
  cd shellgame-$pkgver
  make clean && make
}

package() {
  cd shellgame-$pkgver
  make DESTDIR="$pkgdir" install
}
