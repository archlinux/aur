# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=pacman-offline
pkgver=0.2.1
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
sha256sums=('1f8ce5a1bf3d7145feba00c7d4827885e1686fae2fa35d338eb834ed4efb38ef'
            'SKIP')

package() {
	cd "pacman-offline-${pkgver}/"

	make DESTDIR=${pkgdir} install
}

