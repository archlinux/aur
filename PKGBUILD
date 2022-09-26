pkgname=nextaw
pkgver=0.15.1
pkgrel=1
pkgdesc="Athena Widgets with NEXTSTEP appearance"
arch=("x86_64")
url="https://siag.nu/pub/neXtaw/"
license=("MIT")
depends=("libxt" "libxmu")
source=("https://siag.nu/pub/neXtaw/neXtaw-$pkgver.tar.gz")
sha256sums=("7cfe6706b9a76620389e04a7a87f06786c8a6606829c3157c3e9e45a805bb584")

build() {
	cd "neXtaw-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "neXtaw-$pkgver"
	make -k check
}

package() {
	cd "neXtaw-$pkgver"
	make DESTDIR="$pkgdir/" install
}
