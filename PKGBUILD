pkgname=dovecot-wormhole
pkgver=0.14
pkgrel=1
pkgdesc="bring back Dovecot's replication feature for Dovecot 2.4 and later"
arch=(x86_64)
url="https://codeberg.org/errror/wormhole"
license=('LGPL-2.1-only')
depends=()
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/errror/wormhole/archive/v$pkgver.tar.gz")
sha256sums=('9b86016d60133af8231f410478aafa0c926e575c0b5d81c6055757a4d2192b2d')

build() {
	cd "wormhole"
	test -x configure || ./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "wormhole"
	make install DESTDIR="$pkgdir"
}
