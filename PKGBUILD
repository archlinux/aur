# Maintainer: ovf <ovf@mm.st>
pkgname=liburing
pkgver=0.5
pkgrel=1
pkgdesc="Linux-native io_uring I/O access library"
arch=(i686 x86_64)
url="http://git.kernel.dk/cgit/liburing/"
license=('LGPL2.1')
depends=(glibc)
provides=(liburing.so)
source=("https://git.kernel.dk/cgit/liburing/snapshot/liburing-$pkgver.tar.bz2")
md5sums=('902e111b5d5e57dbd2bfc309283a520d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --mandir=/usr/share/man
  make
}

package() {
  pwd
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir/" make install
}
