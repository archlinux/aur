# Contributor: Mark Carter <alt.mcarter@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=neoleo
pkgver=12.2
pkgrel=1
pkgdesc="Lightweight curses spreadsheet based on GNU oleo"
arch=('x86_64')
url="https://github.com/blippy/neoleo"
license=('GPL')
depends=('ncurses')
source=($pkgname-$pkgver.tar.gz::https://github.com/blippy/neoleo/archive/v$pkgver.tar.gz)
sha256sums=('8eb71b8dbbe875c86b12c5c6e129e88bb4022302e158c7aaf18dcaf257836225')

build() {
  cd "$pkgname-$pkgver"
  autoreconf -iv
  LIBS+=" -lstdc++fs" ./configure --prefix=/usr 
  make CFLAGS+=" -Werror=use-after-free"
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
 
