# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=wmifs
pkgver=1.8
pkgrel=1
arch=(i686 x86_64)
pkgdesc="A network monitor for all network devices that shows the transmission ratio"
url="http://www.dockapps.net/$pkgname"
license=('GPL')
depends=('libxpm')
source=("http://www.dockapps.net/download/$pkgname-$pkgver.tar.gz")
md5sums=('5d74a93c7d1561ecb3949a1eae8f4fbd')

prepare() {
  cd dockapps-*
  autoreconf -fiv
}

build() {
  cd dockapps-*
  ./configure --prefix=/usr --mandir=/usr/share/man
  make V=0
}

package() {
  cd dockapps-*
  make DESTDIR="$pkgdir" install
}
