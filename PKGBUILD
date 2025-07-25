# Original Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Current Maintainer: MidnightMH <mhbagheri12 (at) Gmail (dot) com> [2025--present]
_basename_=b43-firmware
pkgname=${_basename_}-classic
pkgver=5.100.138
pkgrel=1
pkgdesc="Firmware for Broadcom B43 wireless networking chips - trusted release"
arch=("any")
url="https://wireless.wiki.kernel.org/en/users/Drivers/b43"
license=("unknown")
depends=("linux>=3.2")
makedepends=("b43-fwcutter>=015")
conflicts=(${_basename_})
install=${pkgname}.install
options=(!emptydirs)
source=(https://github.com/minios-linux/b43-firmware/releases/download/b43-firmware/broadcom-wl-5.100.138.tar.bz2)

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
