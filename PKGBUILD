# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mkinitcpio-ykfde
pkgver=0.7.0
pkgrel=1
pkgdesc='Full disk encryption with Yubikey (Yubico key)'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/mkinitcpio-ykfde'
license=('GPL')
depends=('yubikey-personalization' 'cryptsetup' 'iniparser' 'libarchive' 'keyutils')
makedepends=('markdown')
install=mkinitcpio-ykfde.install
backup=('etc/ykfde.conf')
source=("https://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
sha256sums=('f97da3d1b4d449bbc6515b0169e4fd7c773c6462b8c46e5d9e6abf59078e3354'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR=${pkgdir} install-mkinitcpio
}

