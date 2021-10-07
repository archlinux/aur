# Contributor: Marti Raudsepp <marti@juffo.org>
pkgname=blktrace
pkgver=1.3.0
pkgrel=1
pkgdesc="Userspace utilities for tracing Linux block layer I/O"
arch=(i686 x86_64)
license=('GPL2')
url="http://brick.kernel.dk/snaps/"
depends=('libaio')
source=("http://brick.kernel.dk/snaps/$pkgname-$pkgver.tar.bz2")
sha256sums=('d6deda03862de2bd1b1b9fba729bbb862d9bca795e6aa7f7ca86b656811a70d6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr mandir=/usr/share/man DESTDIR=$pkgdir/ install
}
