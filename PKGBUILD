# Maintainer: Keil Miller Jr <keilmillerjr@outlook.com>
pkgname="endlines"
pkgver=1.9.2
pkgrel=1
pkgdesc="Endlines smartly converts text files line endings."
arch=("x86_64")
url="https://github.com/mdolidon/endlines"
license=('Apache License 2.0')
source=("https://github.com/mdolidon/$pkgname/archive/$pkgver.tar.gz")
md5sums=('d164148541ece2dccc481ae81dd7b543')

build() {
	cd "$pkgname-$pkgver"
	make
}

check() {
	cd "$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgver"
	sudo make DESTDIR="$pkgdir/" install
}
