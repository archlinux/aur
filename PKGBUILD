# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=ompi
pkgver=2.7.0
pkgrel=1
pkgdesc="A lightweight, open source OpenMP compiler and runtime system for C"
arch=('i686' 'x86_64')
url="http://www.cs.uoi.gr/~ompi/"
license=('GPL2')
source=($pkgname-$pkgver.tar.gz::https://paragroup.cse.uoi.gr/wpsite/?download=1060)
md5sums=('96dd8d4201b6de5f1bc5b6074936e9be')

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
