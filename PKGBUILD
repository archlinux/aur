# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-gd
_project=gawkextlib
pkgver=1.0.2
pkgrel=2
pkgdesc="GAWK extension - interface to the GD graphics library"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL')
depends=('gd' 'gawkextlib')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('d5b5494e4e675610fb01e6845e937119')
sha256sums=('7d7a98727b02e59561ab4153f31ef24e54e7e2c0ec45b5c0b013030cbb41ebfe')

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
