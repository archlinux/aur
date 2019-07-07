# Contributor: Feufochmar <feufochmar dot gd at gmail dot com>
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: SirClueless

pkgname=libtcod
pkgver=1.13.0
pkgrel=1
pkgdesc="Roguelike graphics/utility library"
arch=('i686' 'x86_64')
url="https://github.com/libtcod/libtcod"
license=('BSD')
depends=('sdl2')
#makedepends=()
source=("https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz")
md5sums=('b12cb7f07e5815512e206ded073e6411')

build() {
   cd "$srcdir/$pkgname-$pkgver/build/autotools"
   autoreconf -i
   ./configure --prefix=/usr
   make
}

package() {
   cd "$srcdir/$pkgname-$pkgver/build/autotools"
   make DESTDIR="$pkgdir" install
   
   mkdir -p "$pkgdir/usr/share/licenses/libtcod"
   cp "$srcdir/$pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/libtcod"
}

# vim:set ts=2 sw=2 et:
