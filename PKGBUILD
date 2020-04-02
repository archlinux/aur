# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=imcompressor
pkgver=0.8.1
pkgrel=1
pkgdesc="Simple & lossless image compressor."
arch=('any')
url="https://github.com/Huluti/ImCompressor"
license=('GPL3')
depends=('gtk3' 'python' 'jpegoptim' 'optipng' 'pngquant')
makedepends=('meson' 'appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('c019d709d85cf99f99c89a146d5586f6f1efab4e8b80c8dfa392c274c28544dc')

build() {
	arch-meson "ImCompressor-$pkgver" _build
	ninja -C _build
}

package() {
	DESTDIR="$pkgdir" ninja -C _build install
}
