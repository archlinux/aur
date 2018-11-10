# Maintainer: Adam Nielsen <malvineous@shikadi.net>

pkgname=ufiformat
pkgver=0.9.9
pkgrel=2
pkgdesc="USB floppy disk format utility"
arch=('i686' 'x86_64')
url="https://github.com/tedigh/ufiformat/"
license=('GPL')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=()
makedepends=()
options=()
source=('https://github.com/tedigh/ufiformat/archive/v0.9.9.tar.gz')
md5sums=('9a5766b70c469732624d6f7d7941be7d')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	./configure --prefix="/usr"
	make ${MAKEFLAGS}
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make install DESTDIR="$pkgdir"
}
