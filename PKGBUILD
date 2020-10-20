# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>

pkgname=cgames
pkgver=2.2
pkgrel=7
pkgdesc="Collection of three ncurses games. csokoban (sokoban), cmines (minesweeper) and cblocks (sliding-block puzzles)."
arch=('i686' 'x86_64')
url="http://www.muppetlabs.com/~breadbox/software/cgames.html"
license=('GPL2')
depends=('ncurses')
source=(http://www.muppetlabs.com/~breadbox/pub/software/$pkgname-${pkgver}b.tar.gz)
md5sums=('02e9ac92557257d5f4ed5b7391d640fd')

build() {
  cd $srcdir/$pkgname-${pkgver}b

  ./configure --prefix=/usr --with-ncurses

  make DESTDIR=$pkgdir
}

package() {
  cd $srcdir/$pkgname-${pkgver}b

  make DESTDIR=$pkgdir datadir=$pkgdir/usr/share/csokoban mandir=$pkgdir/usr/share/man bindir=$pkgdir/usr/bin csokoban-install
  make DESTDIR=$pkgdir datadir=$pkgdir/usr/share/cmines   mandir=$pkgdir/usr/share/man bindir=$pkgdir/usr/bin cmines-install
  make DESTDIR=$pkgdir datadir=$pkgdir/usr/share/cblocks  mandir=$pkgdir/usr/share/man bindir=$pkgdir/usr/bin cblocks-install
}
