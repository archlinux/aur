# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-json
_project=gawkextlib
pkgver=1.0.1
pkgrel=1
pkgdesc="GAWK extension - interface to RapidJSON for reading/writing JSON"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL')
depends=('rapidjson' 'gawkextlib')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('6b1cf5b55396d5e0f22d729f131a5ff3')
sha256sums=('3613e1ad22ee7769b81ebccb7e4cd68d7bd84555a58675592b1dbd67c5557683')

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
