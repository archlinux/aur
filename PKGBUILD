# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=imcompressor
pkgver=0.6
pkgrel=1
pkgdesc="Simple & lossless image compressor."
arch=('any')
url="https://github.com/Huluti/ImCompressor"
license=('GPL3')
depends=('gtk3' 'python' 'libjpeg-turbo' 'jpegoptim' 'optipng')
makedepends=('meson' 'appstream-glib')
optdepends=('mozjpeg: Recommended, provides libjpeg-turbo')
            # See https://libjpeg-turbo.org/About/Mozjpeg
source=("$pkgname-$pkgver.tar.gz::https://github.com/Huluti/ImCompressor/archive/$pkgver.tar.gz")
sha256sums=('b91550ba6e43b2685a12913f593971d2ec415d6eccbb1fc427c5adcb96250b16')

build() {
	cd "ImCompressor-$pkgver"
	meson --prefix /usr --buildtype=plain _build
	ninja -C _build
}

package() {
	cd "ImCompressor-$pkgver"
	DESTDIR="$pkgdir" ninja -C _build install
}
