# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=pacman-offline
pkgver=0.2.0
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
sha256sums=('fd2cbbed29f376268d9bf2524bde9575b3e9f26fc2a0f8a0d06fef040d2748b5'
            'SKIP')

package() {
	cd "pacman-offline-${pkgver}/"

	make DESTDIR=${pkgdir} install
}

