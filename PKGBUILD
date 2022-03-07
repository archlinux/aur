# Maintainer: solsTiCe d'Hiver <solstice.dhiver@gmail.com>
pkgname=libwifi
pkgver=0.0.4
pkgrel=1
pkgdesc="An 802.11 Frame Parsing and Generation library written in C"
arch=('x86_64')
url="https://libwifi.so"
license=('APACHE')
makedepends=('cmake')
source=("libwifi-${pkgver}.tar.gz::https://github.com/libwifi/libwifi/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d0dd6f896f0744e6bf203f5ffbb22b8215c251ef196c3377bfd338afd5013b9d')

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
