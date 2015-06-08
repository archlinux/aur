# Contributor: Marti Raudsepp <marti@juffo.org>
pkgname=blktrace
pkgver=1.1.0
pkgrel=1
pkgdesc="Userspace utilities for tracing Linux block layer I/O"
arch=(i686 x86_64)
license=('GPL2')
url="http://brick.kernel.dk/snaps/"
depends=('libaio')
source=("http://brick.kernel.dk/snaps/$pkgname-$pkgver.tar.bz2")
sha256sums=('54a2faaa06dd52fd4a56a6aafa2a251990eb8dcf1832bb8c2fb1fc13a74a9295')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr mandir=/usr/share/man DESTDIR=$pkgdir/ install
}
