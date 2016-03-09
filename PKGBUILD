# Maintainer: Lance Chen <cyen0312@gmail.com>

pkgname=jo
pkgver=0.6
pkgrel=1
pkgdesc="JSON output from a shell"
arch=(any)
url="https://github.com/jpmens/jo"
license=('GPL2')
source=("https://github.com/jpmens/jo/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('01eafffc4427ef2955afe0f0e30bece9')
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
