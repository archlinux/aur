# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=nthash
pkgver=0.1.6
pkgrel=1
pkgdesc='Generate NT Hash'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/nthash'
conflicts=('nthash-git')
depends=('nettle')
makedepends=('markdown')
license=('GPL')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("http://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('7a8700ac0d29f83569d5ce008a323a2b1d753721a102284a721c5bd16294c30d'
            'SKIP')

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

