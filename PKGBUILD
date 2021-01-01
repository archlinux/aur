# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=netlink-notify
pkgver=0.8.1
pkgrel=1
pkgdesc='Notify about netlink changes'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/netlink-notify'
depends=('libsystemd' 'libnotify')
makedepends=('systemd' 'markdown')
license=('GPL')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("https://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('7fdf9c08142fbcdfeadd18d2ec26cec9f1905acbfa6cd4dc1008d551e0629cf8'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

