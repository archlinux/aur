# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-mpfr
_project=gawkextlib
pkgver=1.0.3
pkgrel=1
pkgdesc="GAWK extension - interface to the MPFR library"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL')
depends=('mpfr' 'gawkextlib')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('d6f573d841c04fa82086c6813949a0e3')
sha256sums=('08d3799b4b65f963991b2e99c551a5cf26967909966f8b736764e36864ead0d7')

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
