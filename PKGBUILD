# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=imcompressor
pkgver=0.8.3
pkgrel=1
pkgdesc="Simple & lossless image compressor."
arch=('any')
url="https://github.com/Huluti/ImCompressor"
license=('GPL3')
depends=('gtk3' 'python-gobject' 'jpegoptim' 'optipng' 'pngquant')
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('2557b8dea3787f426b487982b7af79b104ac1233e226012bd64e4c56da67bd47')

build() {
	arch-meson "ImCompressor-$pkgver" build
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
