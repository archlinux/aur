# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=imcompressor
pkgver=0.5.2
pkgrel=2
pkgdesc="Simple & lossless image compressor."
arch=('any')
url="https://github.com/Huluti/ImCompressor"
license=('GPL3')
depends=('gtk3' 'python' 'libjpeg-turbo' 'jpegoptim' 'optipng')
makedepends=('meson' 'appstream-glib')
optdepends=('mozjpeg: Recommended, provides libjpeg-turbo')
            # See https://libjpeg-turbo.org/About/Mozjpeg
source=("$pkgname-$pkgver.tar.gz::https://github.com/Huluti/ImCompressor/archive/$pkgver.tar.gz")
sha256sums=('ef90d82249d4a76d10ec2e26fab0ee6c6347171ec43664fe1e389d56eafedfa4')

build() {
	cd "ImCompressor-$pkgver"
	meson --prefix /usr --buildtype=plain _build
	ninja -C _build
}

package() {
	cd "ImCompressor-$pkgver"
	DESTDIR="$pkgdir" ninja -C _build install
}
