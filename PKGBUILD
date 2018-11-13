# Contributor: Pierpaolo Valerio <gondsman@techgeek.co.in>
pkgname=dpic
pkgver=2018.08.15
pkgrel=1
pkgdesc="A pic language interpreter"
arch=('x86_64' 'i686')
url="http://www.ece.uwaterloo.ca/~aplevich/dpic/"
license=('BSD')
makedepends=()
source=("https://ece.uwaterloo.ca/~aplevich/dpic/dpic-$pkgver.tar.gz")
sha256sums=('5583fa03e25ed3805f46329b83aaccb2426400ffcb486736f9278abe17a0f6b7')

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
