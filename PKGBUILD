# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-nl_langinfo
_project=gawkextlib
pkgver=1.1.0
pkgrel=1
pkgdesc="GAWK extension - provides access to nl_langinfo(3)"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL')
makedepends=('gawkextlib')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('07f50eb32e24b14826fc063813846d97')
sha256sums=('3d8a208b9e180be5ff287bd41002cdf38ee859083a0b4e7315c1568f05054b28')

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
