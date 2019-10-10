# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=imcompressor
pkgver=0.3
pkgrel=1
pkgdesc="Simple & lossless image compressor."
arch=('any')
url="https://github.com/Huluti/ImCompressor"
license=('GPL3')
depends=('gtk3' 'python' 'mozjpeg' 'jpegoptim')
makedepends=('meson' 'appstream-glib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Huluti/ImCompressor/archive/$pkgver.tar.gz")
sha256sums=('f63a510046783ddff4f1558769caa30aad0564ff7b0ca1c0ea79ca55569559fe')

build() {
	cd "ImCompressor-$pkgver"
	meson --prefix /usr --buildtype=plain _build
	ninja -C _build
}

package() {
	cd "ImCompressor-$pkgver"
	DESTDIR="$pkgdir" ninja -C _build install
}
