# Contributor: ultraviolet <ultravioletnanokitty@gmail.com>
# Maintainer: Pablo Lezaeta <prflr88 (Arro'a) gmail (puntocom)>

pkgname=b43-firmware-legacy
realname=wl_apsta
pkgver=3.130.20.0
pkgrel=5
pkgdesc="Firmware for legacy Broadcom B43 wireless networking chips"
arch=("i686" "x86_64")
url="http://linuxwireless.org/en/users/Drivers/b43"
license=("GPL")
makedepends=("b43-fwcutter")
options=(!emptydirs)
install="b43-firmware.install"
source=(http://downloads.openwrt.org/sources/${realname}-${pkgver}.o)
sha1sums=('b1f61d283bd7d05ade313da522cb0d0ad4033652')

package() {
	cd "${srcdir}"

	# Create directories
	install -d "${pkgdir}/usr/lib/firmware/"

	# Install to said directories
	b43-fwcutter -w "${pkgdir}/usr/lib/firmware/" "${realname}-${pkgver}.o"
}
