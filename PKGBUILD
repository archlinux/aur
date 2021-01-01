# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=nthash
pkgver=0.1.7
pkgrel=1
pkgdesc='Generate NT Hash'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/nthash'
conflicts=('nthash-git')
depends=('nettle')
makedepends=('markdown')
license=('GPL')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("https://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('6f7fe103f75012dc109faa23bd57dc928854e94f2884c8d693bd93f426ebaa41'
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

