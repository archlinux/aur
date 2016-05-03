# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mkinitcpio-ykfde
pkgver=0.6.2
pkgrel=1
pkgdesc='Full disk encryption with Yubikey (Yubico key)'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/mkinitcpio-ykfde'
license=('GPL')
depends=('yubikey-personalization' 'cryptsetup' 'iniparser' 'libarchive' 'keyutils')
makedepends=('markdown')
install=mkinitcpio-ykfde.install
backup=('etc/ykfde.conf')
source=("http://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
sha256sums=('51f28e8e38083145d3085e7aedd3368099845b2c11b2e3e987038b3656c8b568'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR=${pkgdir} install-mkinitcpio
}

