# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=reprapfirmware-bin
pkgver=1.2.2.1
pkgrel=1
pkgdesc="RepRapFirmware Software Bundle"
arch=('any')
url="https://github.com/dc42/RepRapFirmware.git"
license=('GPL3')
provides=("reprapfirmware=${pkgver}")
conflicts=("reprapfirmware")
depends=('duetcontrolserver>=1.0.3.4' 'duetsd')
backup=(
	'opt/dsf/sd/sys/Duet3Firmware_EXP3HC.bin'
	'opt/dsf/sd/sys/Duet3Firmware_MB6HC.bin'
	'opt/dsf/sd/sys/Duet3Firmware_MBP05.bin'
	'opt/dsf/sd/sys/Duet3Firmware_TOOL1LC.bin'
	'opt/dsf/sd/sys/Duet3Firmware_TOOL1XD.bin'
)
source=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/reprapfirmware_${pkgver}-1_all.deb")
sha512sums=('4778b9ea01e72ff315a850ce85576576e3ed186c64c6c57d59a2f633269cdcc225b008122e63df667084de7c349a3e88cc5026174f75d6f5e9aa748b19122e6e')

prepare() {
    tar -xf data.tar.xz
}

package() {
	# Virtual SD Card
	install -dm 755 "${pkgdir}"/opt/dsf/sd/sys
	install -m 644 "${srcdir}"/opt/dsf/sd/sys/* "${pkgdir}"/opt/dsf/sd/sys/
}
