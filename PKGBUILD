# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=reprapfirmware-bin
pkgver=3.1.1
pkgrel=1
pkgdesc="RepRapFirmware Software Bundle"
arch=('any')
url="https://github.com/dc42/RepRapFirmware.git"
license=('GPL3')
provides=("reprapfirmware=${pkgver}")
conflicts=("reprapfirmware")
depends=('duetcontrolserver>=1.0.3.4' 'duetsd>=1.0.4')
backup=(
	'opt/dsf/sd/sys/Duet3_SBCiap_MB6HC.bin'
	'opt/dsf/sd/sys/Duet3Bootloader_EXP.bin'
	'opt/dsf/sd/sys/Duet3Bootloader_TOOL.bin'
	'opt/dsf/sd/sys/Duet3Firmware_EXP3HC.bin'
	'opt/dsf/sd/sys/Duet3Firmware_MB6HC.bin'
	'opt/dsf/sd/sys/Duet3Firmware_TOOL1LC.bin'
	'opt/dsf/sd/sys/Duet3iap_spi_MB6HC.bin'
)
install="${pkgname}.install"
source=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/reprapfirmware_${pkgver}-1_all.deb")
md5sums=('000fc5e9644215ecc8f8b02d34d0a193')
sha1sums=('6c6f9ea18a523e1c0fed242ab3b20c26cca806f4')
sha256sums=('3702c7ffd72204dc4962eabfc701c890ed227db959071f50b42835bad9182586')
sha512sums=('eca1b081a18a8c18d29118ad224ac7b21c7b6e1b1475f05d3d5d0d32e67ed5ba8befe2988b047e1c16f6e4f6db31440694b02129b53ecaacb8e0a97e3998220a')

prepare() {
    tar -xf data.tar.xz
}

package() {
	# Virtual SD Card
	install -dm 755 "${pkgdir}"/opt/dsf/sd/sys
	install -m 644 "${srcdir}"/opt/dsf/sd/sys/* "${pkgdir}"/opt/dsf/sd/sys/
}
