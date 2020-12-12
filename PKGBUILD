# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-json
_project=gawkextlib
pkgver=2.0.0
pkgrel=1
pkgdesc="GAWK extension - interface to RapidJSON for reading/writing JSON"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL')
depends=('gcc-libs')
makedepends=('rapidjson' 'gawkextlib' 'gawk>=4.2.1')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('08b46293a6b096de535f53db96e9b858')
sha256sums=('d75944e9bfd8a2edca5c794dffd42a300ba1017abf3f850f53c395d2af8ca0f2')

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
