# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=netlink-notify
pkgver=0.7.5
pkgrel=1
pkgdesc='Notify about netlink changes'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/netlink-notify'
depends=('libsystemd' 'libnotify')
makedepends=('systemd' 'markdown')
license=('GPL')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("http://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('a42b42fa28f8f5a9bef2c98184b95702dead3452ee399cd2b9959f3f2f01619a'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

