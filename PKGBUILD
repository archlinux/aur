# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=curtail
pkgver=1.1.0
pkgrel=2
pkgdesc="Simple & lossless image compressor."
arch=('any')
url="https://github.com/Huluti/Curtail"
license=('GPL3')
depends=('gtk3' 'python-gobject' 'jpegoptim' 'optipng' 'pngquant')
makedepends=('meson')
#checkdepends=('appstream-glib')
conflicts=('imcompressor')
replaces=('imcompressor')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('bb00badaace6e81291add96ef383cc0ae6f4aef675587eccdef875522c3b08a6')

build() {
	arch-meson "Curtail-$pkgver" build
	meson compile -C build
}

#check() {
#	meson test -C build --print-errorlogs
#}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
