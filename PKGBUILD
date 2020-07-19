# Maintainer: Lance Chen <cyen0312@gmail.com>

pkgname=jo
pkgver=1.4
pkgrel=1
pkgdesc="JSON output from a shell"
arch=(any)
url="https://github.com/jpmens/jo"
license=('GPL2')
source=("https://github.com/jpmens/jo/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('24c64d2eb863900947f58f32b502c95fec8f086105fd31151b91f54b7b5256a2')
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
