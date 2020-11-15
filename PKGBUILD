# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=imcompressor
pkgver=0.8.4
pkgrel=1
pkgdesc="Simple & lossless image compressor."
arch=('any')
url="https://github.com/Huluti/ImCompressor"
license=('GPL3')
depends=('gtk3' 'python-gobject' 'jpegoptim' 'optipng' 'pngquant')
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('41fa12bca1be544846630e231f451bb60d7a3d5d17d0e63aa9c3cec8a306e82d')

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
