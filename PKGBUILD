# Contributor: Mark Carter <alt.mcarter@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=neoleo
pkgver=12.0
pkgrel=1
pkgdesc="Lightweight curses spreadsheet based on GNU oleo"
arch=('x86_64')
url="https://github.com/blippy/neoleo"
license=('GPL')
depends=('ncurses')
source=($pkgname-$pkgver.tar.gz::https://github.com/blippy/neoleo/archive/v$pkgver.tar.gz)
sha256sums=('e31492080c5d0586f11cfcc2a998cea403ac4f63df1bfe3f7cc1cab145656d30')

build() {
  cd "$pkgname-$pkgver"
  autoreconf -iv
  LIBS+="-lstdc++fs" ./configure --prefix=/usr 
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
