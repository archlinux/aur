# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=curtail
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple & lossless image compressor."
arch=('any')
url="https://github.com/Huluti/Curtail"
license=('GPL3')
depends=('gtk3' 'python-gobject' 'jpegoptim' 'optipng' 'pngquant')
makedepends=('meson')
conflicts=('imcompressor')
replaces=('imcompressor')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('70bcf700c29c6b324b0943a70d21fc4d55f403150de524b9e558e10b78f541c3')

build() {
	arch-meson "Curtail-$pkgver" build
	meson compile -C build
}

#check() {
#	meson test -C build
#}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
