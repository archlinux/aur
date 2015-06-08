# Maintainer: ecolinux <ecolinux@gmx.fr>

pkgname=b43-firmware5100
pkg_name=b43-firmware
pkgver=5.100.138
pkgrel=3
pkgdesc="Firmware for Broadcom B43 wireless networking chips old version"
arch=("any")
url="https://wireless.wiki.kernel.org/en/users/Drivers/b43"
license=("GPL")
depends=("linux>=3.2")
makedepends=("b43-fwcutter>=015")
options=(!emptydirs)
source=(http://www.lwfinger.com/${pkg_name}/broadcom-wl-${pkgver}.tar.bz2)

package() {
	cd "${srcdir}"/broadcom-wl-${pkgver}

	# Directories
	install -d "${pkgdir}"/usr/lib/firmware/

	# Application
	b43-fwcutter -w "${pkgdir}"/usr/lib/firmware/ linux/wl_apsta.o

	# Messages
	#msg "You should add 'b43' to the 'MODULES' array of your '/etc/rc.conf' file."
}

sha1sums=('21691a8c99c66f58d18f863ee43593d1633b454c')
