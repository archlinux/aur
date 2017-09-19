# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-errno
_project=gawkextlib
pkgver=1.0.3
pkgrel=1
pkgdesc="GAWK extension - convert errno values to strings and vice versa"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL')
depends=('gawkextlib')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('40026e0feb28ce7ef1ff10481f16af84')
sha256sums=('ff3ecc2fd233fb4b49b7158e4f2c6153d2311c143d88a02b61202317d64a8953')

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
