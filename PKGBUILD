# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=ompi
pkgver=1.2.2
pkgrel=1
pkgdesc="A lightweight, open source OpenMP compiler and runtime system for C"
arch=('i686' 'x86_64')
url="http://www.cs.uoi.gr/~ompi/"
license=('GPL2')
source=("http://www.cs.uoi.gr/~ompi/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('3c9d0ce00908a81403e92e0dc9247ec32c34a86f5ef039ba21a8fc2c004ff975')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix="$pkgdir/usr"
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install
}

# vim:set ts=2 sw=2 et:
