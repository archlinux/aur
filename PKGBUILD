# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=imcompressor
pkgver=0.8
pkgrel=2
pkgdesc="Simple & lossless image compressor."
arch=('any')
url="https://github.com/Huluti/ImCompressor"
license=('GPL3')
depends=('gtk3' 'python' 'jpegoptim' 'optipng' 'pngquant')
makedepends=('meson' 'appstream-glib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Huluti/ImCompressor/archive/$pkgver.tar.gz")
sha256sums=('81aa7dba77de73809352c70b4c13314954510750007415a865304863d505cd73')

build() {
	cd "ImCompressor-$pkgver"
	arch-meson _build
	ninja -C _build
}

package() {
	cd "ImCompressor-$pkgver"
	DESTDIR="$pkgdir" ninja -C _build install
}
