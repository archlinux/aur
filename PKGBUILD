# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-timex
_project=gawkextlib
pkgver=1.0.0
pkgrel=1
pkgdesc="GAWK extension - implements the timex API"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('b95f088759c7b810f7b9ea9cf090420b')
sha256sums=('131ba120ae013ef8e49c5f16904e5a27bfb65ff5bdb9008dd7474b352e127524')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
