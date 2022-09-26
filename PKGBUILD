pkgname=mowitz
pkgver=0.3.1
pkgrel=1
pkgdesc="\"More Widgets\" library"
arch=("x86_64")
url="https://siag.nu/pub/mowitz/"
license=("GPL" "LGPL" "MIT")
depends=("libxpm" "libxaw" "nextaw")
source=("https://siag.nu/pub/mowitz/Mowitz-$pkgver.tar.gz")
sha256sums=("6a4a9b2342becf0dd8ecd65d87ac5f88beee84464d0553e1223b201d94b3dfff")

build() {
	cd "Mowitz-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "Mowitz-$pkgver"
	make -k check
}

package() {
	cd "Mowitz-$pkgver"
	make DESTDIR="$pkgdir/" install
}
