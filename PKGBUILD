# Maintainer: heinrich5991 <heinrich5991@gmail.com>
pkgname=libsrsbsns
pkgver=0.0.1
pkgrel=1
pkgdesc="A library providing some basic functions for sockets, I/O, etc."
arch=('i686' 'x86_64')
url="https://github.com/srsbsns/libsrsbsns"
license=('BSD')
depends=(glibc)
options=(!libtool)
source=("$pkgname-$pkgver.tar.gz::https://github.com/srsbsns/libsrsbsns/archive/v0.0.1.tar.gz")
sha256sums=('61520cabe79b2e0a5a89de8f530f4b4bec8ff4bed0881266d347941e7635ce01')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver/"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
