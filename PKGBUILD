# Maintainer: Lance Chen <cyen0312@gmail.com>

pkgname=jo
pkgver=1.1
pkgrel=1
pkgdesc="JSON output from a shell"
arch=(any)
url="https://github.com/jpmens/jo"
license=('GPL2')
source=("https://github.com/jpmens/jo/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('918e40e388e6e12a1a4da50b6b73dfd5')
validpgpkeys=()

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
