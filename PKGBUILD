# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=dyndhcpd
pkgver=0.1.0
pkgrel=2
pkgdesc="start DHCP daemon that dynamically creates configuration based on assigned IP address"
arch=('i686' 'x86_64')
url="https://github.com/eworm-de/dyndhcpd"
depends=('dhcp')
optdepends=('ipxe: for network boot')
makedepends=('markdown')
license=('GPL')
backup=('etc/dyndhcpd/dhcpd.conf')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("http://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

sha256sums=('d49cdb68ffbd91b342fa957d72e9df22a51e5fc450d2652616cd45d3130de7e6'
            'SKIP')
