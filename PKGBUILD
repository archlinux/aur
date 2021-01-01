# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mkinitcpio-ykfde
pkgver=0.7.7
pkgrel=1
pkgdesc='Full disk encryption with Yubikey (Yubico key)'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/mkinitcpio-ykfde'
license=('GPL')
depends=('yubikey-personalization' 'cryptsetup' 'iniparser' 'libarchive' 'keyutils')
makedepends=('markdown' 'systemd')
install=mkinitcpio-ykfde.install
backup=('etc/ykfde.conf')
source=("https://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
sha256sums=('995b44aa376a1ec2fbf7f662dd9ae3c169c4d1ad279964dc63b0327f98407f03'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR=${pkgdir} install-mkinitcpio
}

