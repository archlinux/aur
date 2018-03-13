# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=udp514-journal
pkgver=0.0.3
pkgrel=1
pkgdesc='forward syslog from network (udp/514) to systemd-journald'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/udp514-journal'
depends=('systemd')
makedepends=('markdown')
license=('GPL')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("https://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('5f8ed658c3eeb627a43c550ce4966d1a092a67dc7dcaba48ceaa38ab3c21ae0f'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

