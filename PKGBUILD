# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-select
_project=gawkextlib
pkgver=1.1.1
pkgrel=1
pkgdesc="GAWK extension - supports I/O multiplexing and signal trapping"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL')
depends=('gawkextlib')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('cf4e495d5c620fb826d3d843353fb2a9')
sha256sums=('7bf276a971dce008306d5df5b61eaa7b5204c0e534673d3bff3a1e8579e17904')

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
