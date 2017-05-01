# Contributor: Pierpaolo Valerio <gondsman@techgeek.co.in>
pkgname=dpic
pkgver=2017.01.01
pkgrel=1
pkgdesc="A pic language interpreter"
arch=('x86_64' 'i686')
url="http://www.ece.uwaterloo.ca/~aplevich/dpic/"
license=('BSD')
makedepends=()
source=("https://ece.uwaterloo.ca/~aplevich/dpic/dpic-$pkgver.tar.gz")
sha256sums=('ced5610fe137dc55f3f53af0a53ed1a3f95eb18049b9073c8bc66e7c0724a847')

build() {
  mv "$srcdir/$pkgname-$pkgver" "$srcdir/$pkgname"
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR=$pkgdir/usr install
} 
