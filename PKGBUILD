# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=imcompressor
pkgver=0.5
pkgrel=1
pkgdesc="Simple & lossless image compressor."
arch=('any')
url="https://github.com/Huluti/ImCompressor"
license=('GPL3')
depends=('gtk3' 'python' 'mozjpeg' 'jpegoptim')
makedepends=('meson' 'appstream-glib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Huluti/ImCompressor/archive/$pkgver.tar.gz")
sha256sums=('16bd02e0746023ad510e5baede94f093c419ec1881aaaaa9c7a79f5bd6a19bcc')

build() {
	cd "ImCompressor-$pkgver"
	meson --prefix /usr --buildtype=plain _build
	ninja -C _build
}

package() {
	cd "ImCompressor-$pkgver"
	DESTDIR="$pkgdir" ninja -C _build install
}
