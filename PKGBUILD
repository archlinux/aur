# Maintainer: Marti Raudsepp <marti@juffo.org>
pkgname=blktrace
pkgver=1.0.5
pkgrel=1
pkgdesc="Userspace utilities for tracing Linux block layer I/O"
arch=(i686 x86_64)
license=('GPL')
url="http://brick.kernel.dk/snaps/"
depends=('libaio')
source=(http://brick.kernel.dk/snaps/$pkgname-$pkgver.tar.bz2)

build() {
  cd $srcdir/$pkgname-$pkgver/
  make
  make prefix=/usr mandir=/usr/share/man DESTDIR=$pkgdir/ install

  install -dm 755 $pkgdir/usr/share/doc/$pkgname
  cp -r README $pkgdir/usr/share/doc/$pkgname
}
md5sums=('02914c0b51fd16f36095436374e14cc7')
