# Contributor: Feufochmar <feufochmar dot gd at gmail dot com>
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: SirClueless
# Contributor: jiornojiovanni <gianni00palmieri at gmail dot com>

pkgname=libtcod
pkgver=1.18.1
pkgrel=1
pkgdesc="Roguelike graphics/utility library"
arch=('i686' 'x86_64')
url="https://github.com/libtcod/libtcod"
license=('BSD')
depends=('sdl2')
makedepends=('python')
source=("https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz")
md5sums=('c6569b15af053f9d35d99de786adfeab')

build() {
   cd "$srcdir/$pkgname-$pkgver/buildsys/autotools"
   autoreconf -i
   ./configure --prefix=/usr
   make
}

package() {
   cd "$srcdir/$pkgname-$pkgver/buildsys/autotools"
   make DESTDIR="$pkgdir" install
   
   mkdir -p "$pkgdir/usr/share/licenses/libtcod"
   cp "$srcdir/$pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/libtcod"
}

# vim:set ts=2 sw=2 et:
