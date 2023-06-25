# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=pacman-offline
pkgver=0.1.3
pkgrel=1
pkgdesc='offline system update with pacman'
arch=('any')
url='https://github.com/eworm-de/pacman-offline'
license=('GPL')
depends=('systemd' 'pacman' 'pacutils')
makedepends=('git' 'discount')
backup=('etc/pacman.d/offline.conf')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("https://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('e96897ab8aeb0f10a2b8e10258519a389a119ce4cb7b395baa718096fb7268c4'
            'SKIP')

package() {
	cd "pacman-offline-${pkgver}/"

	make DESTDIR=${pkgdir} install
}

