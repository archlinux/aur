# Contributor: Feufochmar <feufochmar dot gd at gmail dot com>
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: SirClueless

pkgname=libtcod
pkgver=1.6.5
pkgrel=1
pkgdesc="Roguelike graphics/utility library"
arch=('i686' 'x86_64')
url="https://bitbucket.org/libtcod/libtcod"
license=('BSD')
depends=('sdl2')
makedepends=('mercurial')
source=("hg+https://bitbucket.org/$pkgname/$pkgname#tag=$pkgver")
md5sums=('SKIP')

build() {
   cd "$srcdir/$pkgname/build/autotools"
   autoreconf -i
   ./configure --prefix=/usr
   make
}

package() {
   cd "$srcdir/$pkgname/build/autotools"
   make DESTDIR="$pkgdir" install
   
   mkdir -p "$pkgdir/usr/share/licenses/libtcod"
   cp "$srcdir/$pkgname/LIBTCOD-LICENSE.txt" "$pkgdir/usr/share/licenses/libtcod"
}

# vim:set ts=2 sw=2 et:
