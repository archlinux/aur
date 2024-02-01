# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=pacman-offline
pkgver=0.2.4
pkgrel=1
pkgdesc='offline system update with pacman'
arch=('any')
url='https://github.com/eworm-de/pacman-offline'
license=('GPL')
depends=('systemd' 'pacman')
makedepends=('git' 'discount')
backup=('etc/pacman.d/offline.conf')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("https://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('0084bc54b970032eadbab5a6edd5798f88b8f3f22e3f265f79ee54611d3091e1'
            'SKIP')

package() {
	cd "pacman-offline-${pkgver}/"

	make DESTDIR=${pkgdir} install
}

