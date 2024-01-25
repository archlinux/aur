# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-lmdb
_project=gawkextlib
pkgver=1.1.3
pkgrel=1
pkgdesc="GAWK extension - interface to the LMDB API"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL')
depends=('gawkextlib' 'glibc' 'lmdb')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('c26a97402460d8ae94ec0886d45c4180')
sha256sums=('e3d0b899f2f56c0158404d105f1812fa8886bccd45adc3b9dd7da851005aa422')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --enable-silent-rules
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
