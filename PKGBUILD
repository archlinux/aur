# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=udp514-journal
pkgver=0.3.0
pkgrel=1
pkgdesc='forward syslog from network (udp/514) to systemd-journald'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/udp514-journal'
depends=('systemd')
makedepends=('discount')
license=('GPL')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("https://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('bfa74c1050d7f5970b04ba9d25d77ee2716e41dcb2e5442e03604aa133920a52'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make VERSION="${pkgver}-${pkgrel}"
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

