# Maintainer: Pablo Lezaeta <prflr88 (arro'a) gmail.com>
# Contributor:Sarkasper <echo a2FzcGVyLm1lbnRlbkBnbXguY29tCg== | base64 -d>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=b43-firmware-lts
realname=broadcom-wl
pkgver=5.10.56.27.3
pkgrel=7
pkgdesc="Firmware for Broadcom B43 wireless networking chips for the linux-lts kernel"
arch=("i686" "x86_64")
url="http://linuxwireless.org/en/users/Drivers/b43"
license=("GPL")
depends=("linux-lts>=3.2")
makedepends=("b43-fwcutter>=014")
conflicts=("b43-firmware")
provides=("b43-firmware=5.10.45.37.3")
options=(!emptydirs)
source=("http://mirror2.openwrt.org/sources/${realname}-${pkgver}_mipsel.tar.bz2")
sha1sums=('0732e266f36755ae62fdc940c57bf989f7ee62ea')

package() {
	cd "${srcdir}/${realname}-${pkgver}"

	# Directories
	install -d "${pkgdir}/usr/lib/firmware/"

	# Application
	b43-fwcutter -w ""${pkgdir}/usr/lib/firmware/"" "driver/wl_apsta/wl_prebuilt.o"
}
