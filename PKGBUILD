# Mantainer: dalz <dalz @t disroot d0t org>
pkgname=guile-ncurses
pkgver=3.0
pkgrel=2
pkgdesc='Guile bindings for the ncurses library'
arch=('x86_64')
license=('GPL3' 'LGPL3')
depends=('guile' 'ncurses')
url='http://www.gnu.org/software/guile-ncurses/'
source=(ftp://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('0e4a9eef7237aeef6cc9e5e1fa8513bfd328e971efd74d8d78d543aa9c5b1d0d'
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
