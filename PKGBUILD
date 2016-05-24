# Contributor: Pierpaolo Valerio <gondsman@techgeek.co.in>
pkgname=dpic
pkgver=20160112
pkgrel=1
pkgdesc="A pic language interpreter"
arch=('x86_64' 'i686')
url="http://www.ece.uwaterloo.ca/~aplevich/dpic/"
license=('BSD')
makedepends=('gcc')
source=('https://ece.uwaterloo.ca/~aplevich/dpic/dpic.tar.gz')
md5sums=('abf984ffdd14bc58acb0dd6633e8d211')

build() {
  mv "$srcdir/$pkgname-2016.01.12" "$srcdir/$pkgname"
  cd "$srcdir/$pkgname"
  make
}

package() {
  mkdir -p $pkgdir/usr/share/man/man1
  mv dpic/doc/dpic.1 $pkgdir/usr/share/man/man1

  cd "$srcdir/$pkgname"
  make DESTDIR=$pkgdir/usr install
} 
