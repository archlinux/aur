# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=extract-artwork
pkgver=0.0.5
pkgrel=1
pkgdesc='extract artwork from media files '
arch=('i685' 'x86_64')
url='https://github.com/eworm-de/extract-artwork'
depends=('ffmpeg' 'libavformat.so' 'libavutil.so')
makedepends=('discount')
license=('GPL')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("https://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('4b69cdb16844efcaa4be3dbcf8a947cfeeab4d284cd722569525ef295b8cea0a'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make VERSION="${pkgver}-${pkgrel}"
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

