# Maintainer: Marti Raudsepp <marti@juffo.org>
pkgname=blktrace
pkgver=1.0.1
pkgrel=1
pkgdesc="Userspace utilities for tracing Linux block layer I/O"
arch=(i686 x86_64)
license=('GPL')
url="http://brick.kernel.dk/snaps/"
depends=('libaio')
source=(http://brick.kernel.dk/snaps/$pkgname-$pkgver.tar.bz2)
md5sums=('2ee706ed1a7fc378edb2fbdbce0a11fb')

build() {
  cd $srcdir/$pkgname-$pkgver/
  make || return 1
  make prefix=/usr mandir=/usr/share/man DESTDIR=$pkgdir/ install || return 1

  install -dm 755 $pkgdir/usr/share/doc/$pkgname
  cp -r README $pkgdir/usr/share/doc/$pkgname
}
