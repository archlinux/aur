# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawkextlib
_project=$pkgname
pkgver=1.0.2
pkgrel=1
pkgdesc="Library containing APIs used by various GAWK extensions"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('23affb4f0936e55c3fdb9b30c7c03039')
sha256sums=('e3959df018680dde196087120e5672cf1b98cc9c2b1c391c0957ee9f00558048')

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
