# Maintainer: Lara Maia <lara@craft.net.br>
# Contributor: sebikul <sebikul@gmail.com>
# Contributor: Javier 'Phrodo_00' Aravena  <phrodo.00@gmail.com>

pkgname=ascii-invaders
pkgver=0.1
pkgrel=1
pkgdesc="Clone of Space Invaders for text-terminals using the curses library"
arch=(i686 x86_64)
url="https://github.com/macdice/ascii-invaders"
license=('GPL2')
depends=('ncurses')
source=(http://web.archive.org/web/20100417061809/http://www.ip9.org/munro/invaders/invaders$pkgver.tgz)
md5sums=('62816f153af4b2510ba0ed2cf19fb88c')

build() {
  cd "$srcdir"/invaders
  
  make
}

package(){
  cd "$srcdir"/invaders
  
  install -Dm755 ascii_invaders "$pkgdir"/usr/bin/ascii_invaders
  install -Dm644 GPL "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
