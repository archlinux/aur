# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=netlink-notify
pkgver=0.8.0
pkgrel=1
pkgdesc='Notify about netlink changes'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/netlink-notify'
depends=('libsystemd' 'libnotify')
makedepends=('systemd' 'markdown')
license=('GPL')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("https://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('b5f0245ed5d5171375c38403b5af2950b09cacfaee72b09e249d3198c2dad8d9'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

