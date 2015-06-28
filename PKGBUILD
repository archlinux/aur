# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mkinitcpio-ykfde
pkgver=0.5.2
pkgrel=2
pkgdesc="Full disk encryption with Yubikey (Yubico key)"
arch=('i686' 'x86_64')
url="https://github.com/eworm-de/mkinitcpio-ykfde"
license=('GPL')
conflicts=('mkinitcpio-ykfde-git')
depends=('yubikey-personalization' 'cryptsetup' 'iniparser' 'libarchive')
makedepends=('markdown')
install=mkinitcpio-ykfde.install
backup=('etc/ykfde.conf')
source=("http://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
sha256sums=('8bb8519a19dcdb7ac1c11eeecd7e5ff2685b509083701a1b928f857ae70a20ac'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR=${pkgdir} install-mkinitcpio
}

