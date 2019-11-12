# Maintainer: Lance Chen <cyen0312@gmail.com>

pkgname=jo
pkgver=1.3
pkgrel=1
pkgdesc="JSON output from a shell"
arch=(any)
url="https://github.com/jpmens/jo"
license=('GPL2')
source=("https://github.com/jpmens/jo/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('de25c95671a3b392c6bcaba0b15d48eb8e2435508008c29477982d2d2f5ade64')
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
