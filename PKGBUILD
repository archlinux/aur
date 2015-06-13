# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>
pkgname=cgames
pkgver=2.2
pkgrel=5
pkgdesc="Collection of three ncurses games. csokoban (sokoban), cmines (minesweeper) and cblocks (sliding-block puzzles)."
arch=('i686' 'x86_64')
url="http://www.muppetlabs.com/~breadbox/software/cgames.html"
license=('GPL2')
depends=(ncurses)
source=(http://www.muppetlabs.com/~breadbox/pub/software/$pkgname-${pkgver}a.tar.gz)
md5sums=('9222c1a1720444977d4cd9b0e95894db')

build() {
  cd "$srcdir/$pkgname-${pkgver}a"

  ./configure --prefix=/usr --with-ncurses

  make DESTDIR=$pkgdir
}

package() {
  cd "$srcdir/$pkgname-${pkgver}a"

  make DESTDIR=$pkgdir datadir=$pkgdir/usr/share/csokoban mandir="$pkgdir/usr/share/man/" bindir="$pkgdir/usr/bin" csokoban-install
  make DESTDIR=$pkgdir datadir=$pkgdir/usr/share/cmines mandir="$pkgdir/usr/share/man/" bindir="$pkgdir/usr/bin" cmines-install
  make DESTDIR=$pkgdir datadir=$pkgdir/usr/share/cblocks mandir="$pkgdir/usr/share/man/" bindir="$pkgdir/usr/bin" cblocks-install
}

# vim:set ts=2 sw=2 et:
