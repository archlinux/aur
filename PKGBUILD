# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=dyndhcpd
pkgver=0.1.1
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
sha256sums=('575ad23ce2529303d86cde6f44963d1b1929cb2beb72614886a5f456cec47645'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

