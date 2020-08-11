# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=imcompressor
pkgver=0.8.2
pkgrel=1
pkgdesc="Simple & lossless image compressor."
arch=('any')
url="https://github.com/Huluti/ImCompressor"
license=('GPL3')
depends=('gtk3' 'python-gobject' 'jpegoptim' 'optipng' 'pngquant')
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('fa53b73e1134dea17c3f44473d8df2ce5db382ae3d2b639993fcba7c970a5012')

build() {
	arch-meson "ImCompressor-$pkgver" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
