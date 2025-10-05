# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=extract-artwork
pkgver=0.0.4
pkgrel=2
pkgdesc='extract artwork from media files '
arch=('i685' 'x86_64')
url='https://github.com/eworm-de/extract-artwork'
depends=('ffmpeg' 'libavformat.so' 'libavutil.so')
makedepends=('discount')
license=('GPL')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("https://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('1f6838235cdd9399f4865062df43925397ecff38134bc2cf222603953bb65cd5'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

