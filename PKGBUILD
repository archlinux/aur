# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=extract-artwork
pkgver=0.0.1
pkgrel=1
pkgdesc='extract artwork from media files '
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/extract-artwork'
depends=('ffmpeg')
makedepends=('markdown')
license=('GPL')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("http://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('e656bf4db19bc43c435a598094960c83db45a5031535765250815fba6c3dd2d7'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

