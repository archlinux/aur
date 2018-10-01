# Contributor: Marti Raudsepp <marti@juffo.org>
pkgname=blktrace
pkgver=1.2.0
pkgrel=1
pkgdesc="Userspace utilities for tracing Linux block layer I/O"
arch=(i686 x86_64)
license=('GPL2')
url="http://brick.kernel.dk/snaps/"
depends=('libaio')
source=("http://brick.kernel.dk/snaps/$pkgname-$pkgver.tar.bz2")
sha256sums=('26961888f7308f5e1343b16c44a59d2ab190e12ae17b1841e4a4e304bd3a3f45')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr mandir=/usr/share/man DESTDIR=$pkgdir/ install
}
