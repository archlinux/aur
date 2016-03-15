# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=dyndhcpd
pkgver=0.1.3
pkgrel=1
pkgdesc='start DHCP daemon that dynamically creates configuration based on assigned IP address'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/dyndhcpd'
depends=('dhcp')
optdepends=('ipxe: for network boot')
makedepends=('markdown')
license=('GPL')
backup=('etc/dyndhcpd/dhcpd.conf')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("http://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('4fcffd90e76b0d19ca215496aa569fce9817d3a81719f36d17975308d9badbc2'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

