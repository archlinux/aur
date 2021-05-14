# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Jason A. Donenfeld <Jason@zx2c4.com>

pkgname=wireguard-dkms
pkgver=1.0.20210424
pkgrel=2
pkgdesc='next generation secure network tunnel - module sources'
arch=('x86_64')
url='https://www.wireguard.com/'
license=('GPL')
depends=('dkms')
provides=('WIREGUARD-MODULE')
validpgpkeys=('AB9942E6D4A4CFC3412620A749FC7012A5DE03AE') # Jason A. Donenfeld <Jason@zx2c4.com>
source=("https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-${pkgver}.tar"{.xz,.asc})
sha256sums=('8839139a53733bd20602e39cfc679a8176747dae8fe9f9c7fce28f8fba71abde'
            'SKIP')

package() {
	cd wireguard-linux-compat-${pkgver}/

	make -C src/ \
		DESTDIR="${pkgdir}/" \
		DKMSDIR="/usr/src/wireguard-${pkgver}/" \
		dkms-install
}
