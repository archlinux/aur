# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: dalz <dalz @t disroot d0t org>
pkgname=guile-ncurses
pkgver=3.1
pkgrel=1
pkgdesc='Guile bindings for the ncurses library'
arch=('x86_64')
license=('GPL3' 'LGPL3')
depends=('guile' 'ncurses')
url='http://www.gnu.org/software/guile-ncurses/'
source=(ftp://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('ee89e8ceafcab9dd0ef3fc1acc9b10f4d21ba4b256d329d842d6183e63f8d733'
            'SKIP')
validpgpkeys=('7C378E20D1561BC9E9CB3A5454ADD17A8A1F7454') # Michael Gran <spk121@yahoo.com>

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
