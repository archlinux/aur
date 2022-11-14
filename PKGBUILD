# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mkinitcpio-ykfde
pkgver=0.7.9
pkgrel=1
pkgdesc='Full disk encryption with Yubikey (Yubico key)'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/mkinitcpio-ykfde'
license=('GPL')
depends=('yubikey-personalization' 'cryptsetup' 'iniparser' 'libarchive' 'keyutils')
makedepends=('discount' 'systemd')
install=mkinitcpio-ykfde.install
backup=('etc/ykfde.conf')
source=("https://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
sha256sums=('2b27226934a65d7fd1eb3af368398c4c9301c0ce30a8e73e1707a887587e68c3'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR=${pkgdir} install-mkinitcpio
}

