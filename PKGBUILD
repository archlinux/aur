# Maintainer: Adam Nielsen <malvineous@shikadi.net>

pkgname=ufiformat
pkgver=0.9.9
pkgrel=1
pkgdesc="USB floppy disk format utility"
arch=('i686' 'x86_64')
url="http://www.geocities.jp/tedi_world/format_usbfdd_e.html"
license=('GPL')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=()
makedepends=()
options=()
source=('http://www.geocities.jp/tedi_world/ufiformat-0.9.9.tar.gz')
md5sums=('18e41a189b81b1599a38ce8640698b7f')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	./configure --prefix="/usr"
	make ${MAKEFLAGS}
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make install DESTDIR="$pkgdir"
}
