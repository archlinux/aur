# Maintainer: solsTiCe d'Hiver <solstice.dhiver@gmail.com>
pkgname=libwifi
pkgver=0.0.1
pkgrel=1
pkgdesc="An 802.11 Frame Parsing and Generation library written in C"
arch=('x86_64')
url="https://libwifi.so"
license=('APACHE')
makedepends=('cmake')
source=("libwifi-${pkgver}.tar.gz::https://github.com/libwifi/libwifi/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('74fae03460c335fa743325b71ac11cded348e9f05a0a22a8ee941d609a026ed8')

build() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	cd build
	cmake ..
	make
}

package() {
	cd "$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}
