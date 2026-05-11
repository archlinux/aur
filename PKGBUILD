# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=nthash
pkgver=0.1.8
pkgrel=1
pkgdesc='Generate NT Hash'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/nthash'
conflicts=('nthash-git')
depends=('nettle' 'libnettle.so')
makedepends=('discount')
license=('GPL-3.0-or-later')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("https://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('f434e3239a3d0734b6318653cb89e8fd69821f82b43083a17b35f378d1164b49'
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

