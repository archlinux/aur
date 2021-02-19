# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=python-bus
pkgver=3.1.2
pkgrel=1
pkgdesc="Python 3 module for bus"
arch=(i686 x86_64)
url="https://github.com/maandree/python-bus"
license=('custom:ISC')
depends=(bus python)
makedepends=(cython)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(fd4325d226b94ce08095bef56a86b5b2a0b639f8d8e4b315a717f84e1de9f7f1)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}

