# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=nthash
pkgver=0.1.5
pkgrel=5
pkgdesc="Generate NT Hash"
arch=('i686' 'x86_64')
url="https://github.com/eworm-de/nthash"
conflicts=('nthash-git')
depends=('nettle')
makedepends=('markdown')
license=('GPL')
source=("http://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

check() {
	cd ${pkgname}-${pkgver}/

	make check
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

sha256sums=('7ace1ef0ae3e1c87b0a84adc59be8ed75574f9d11191025668b8856fc21449e6'
            'SKIP')
