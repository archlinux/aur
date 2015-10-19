# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=ompi
pkgver=1.2.3
pkgrel=1
pkgdesc="A lightweight, open source OpenMP compiler and runtime system for C"
arch=('i686' 'x86_64')
url="http://www.cs.uoi.gr/~ompi/"
license=('GPL2')
source=("http://paragroup.cs.uoi.gr/wpsite/?download=345")
md5sums=('cc5725c78652bda9b3722401f4251bcd')

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
