# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=extract-artwork
pkgver=0.0.3
pkgrel=2
pkgdesc='extract artwork from media files '
arch=('i685' 'x86_64')
url='https://github.com/eworm-de/extract-artwork'
depends=('ffmpeg')
makedepends=('discount')
license=('GPL')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("https://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('a8d1d26ced98db1412f462274b0a0a93f0572f23042700d5576927c8fb31bf23'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	sed -i 's/LIBAVCODEC_VERSION_INT/LIBAVFORMAT_VERSION_INT/' extract-artwork.c
	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

