# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-mpfr
_project=gawkextlib
pkgver=1.1.0
pkgrel=2
pkgdesc="GAWK extension - interface to the MPFR library"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL')
depends=('gawkextlib' 'glibc' 'gmp' 'mpfr')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('c696a6373c093eff7841c3962ca21676')
sha256sums=('295d9e83fdca0703f74c3de58b387317a7b6d1a5b3d45104aee2d279e5676d10')

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
