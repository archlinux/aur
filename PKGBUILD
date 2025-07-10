# Maintainer: Mike Pento <mjpento@gmail.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=wmifs
pkgver=1.9
pkgrel=1
arch=(i686 x86_64)
pkgdesc="A network monitor for all network devices that shows the transmission ratio"
url="http://www.dockapps.net/$pkgname"
license=('GPL')
options+=('!debug')
depends=('libxpm' 'libdockapp')
source=("http://www.dockapps.net/download/$pkgname-$pkgver.tar.gz")
md5sums=('3c361b0ee6209b25095dbda1130f60c7')

prepare() {
  cd $srcdir/$pkgname-$pkgver 
  autoreconf -fiv
}

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man
  make V=0
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
