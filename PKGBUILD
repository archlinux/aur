# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=udp514-journal
pkgver=0.2.1
pkgrel=1
pkgdesc='forward syslog from network (udp/514) to systemd-journald'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/udp514-journal'
depends=('systemd')
makedepends=('discount')
license=('GPL')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("https://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('6e16cb381d979b0d0c9ed3d35621b36094818a64506728f0f68229e454ceb5bc'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

