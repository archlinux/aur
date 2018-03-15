# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-json
_project=gawkextlib
pkgver=1.0.2
pkgrel=1
pkgdesc="GAWK extension - interface to RapidJSON for reading/writing JSON"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL')
makedepends=('rapidjson' 'gawkextlib' 'gawk>=4.2.1')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('ccd1c568a4d6e6dc1f53791ea49f1d1a')
sha256sums=('e20e1376e844af4c6adbcb76dd9756ae51810a1a76bcecbfce32593a2f3f013d')

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
