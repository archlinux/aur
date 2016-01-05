# Author: Jayson Reis <santosdosreis@gmail.com>

pkgname=peg
pkgver=0.1.15
pkgrel=1
pkgdesc="Recursive-descent parser generators for C"
arch=('x86_64')
url="http://piumarta.com/software/peg/"
license=('MIT')
source=(http://piumarta.com/software/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('70c6638a9c98db5a57df8076897c86a9')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  echo $pkgdir
  local mandir="$pkgdir/usr/share/man/man1"
  mkdir -p "$mandir"
  make PREFIX="$pkgdir/usr" MANDIR="$mandir" install
}

# vim:set ts=2 sw=2 et:
