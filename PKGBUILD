# Contributor: Pierpaolo Valerio <gondsman@techgeek.co.in>
pkgname=dpic
pkgver=2017.12.01
pkgrel=1
pkgdesc="A pic language interpreter"
arch=('x86_64' 'i686')
url="http://www.ece.uwaterloo.ca/~aplevich/dpic/"
license=('BSD')
makedepends=()
source=("https://ece.uwaterloo.ca/~aplevich/dpic/dpic-$pkgver.tar.gz")
sha256sums=('0a338103af38b84fdf5aa1e7f5f9c8e25bd29480e7d8badb1c0ef32c0bb6b6a7')

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
