# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=dyndhcpd
pkgver=0.1.2
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
sha256sums=('421710ecf8abc4ed4fbdd0415c7097a242c253f844a6544f8fce3f8ff20be32f'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

