# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=imcompressor
pkgver=0.7
pkgrel=1
pkgdesc="Simple & lossless image compressor."
arch=('any')
url="https://github.com/Huluti/ImCompressor"
license=('GPL3')
depends=('gtk3' 'python' 'libjpeg-turbo' 'jpegoptim' 'optipng' 'pngquant')
makedepends=('meson' 'appstream-glib')
optdepends=('mozjpeg: Recommended, provides libjpeg-turbo')
            # See https://libjpeg-turbo.org/About/Mozjpeg
source=("$pkgname-$pkgver.tar.gz::https://github.com/Huluti/ImCompressor/archive/$pkgver.tar.gz")
sha256sums=('8701581e7abb1ba7ed470e6f9914a3c7a9498b948f9d667ffa516c8be1bc15bc')

build() {
	cd "ImCompressor-$pkgver"
	meson --prefix /usr --buildtype=plain _build
	ninja -C _build
}

package() {
	cd "ImCompressor-$pkgver"
	DESTDIR="$pkgdir" ninja -C _build install
}
