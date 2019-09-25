# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=reprapfirmware-bin
pkgver=1.0.4.1
pkgrel=2
pkgdesc="RepRapFirmware Software Bundle"
arch=('any')
url="https://github.com/chrishamm/DuetSoftwareFramework"
license=('GPL3')
provides=("reprapfirmware=${pkgver}")
conflicts=("reprapfirmware")
depends=('duetcontrolserver>=1.0.3.4' 'duetsd')
backup=(
	'opt/dsf/sd/sys/Duet3Firmware_EXP3HC.bin'
	'opt/dsf/sd/sys/Duet3Firmware_MB6HC.bin'
	'opt/dsf/sd/sys/Duet3Firmware_MBP05.bin'
	'opt/dsf/sd/sys/Duet3Firmware_TOOL1LC.bin'
	'opt/dsf/sd/sys/Duet3Firmware_TOOL1LC.bin.noreset'
	'opt/dsf/sd/sys/Duet3Firmware_TOOL1LC_11.bin'
	'opt/dsf/sd/sys/Duet3Firmware_TOOL1LC_11.bin.noreset'
)
source=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/reprapfirmware_${pkgver}-2_all.deb")
sha256sums=('47991343cadc6d4e7e03339fd2e84a0edf4f9570deba71b64d786eaa5e077f4a')

prepare() {
    tar -xf data.tar.xz
}

package() {
	# Virtual SD Card
	install -dm 755 "${pkgdir}"/opt/dsf/sd/sys
	install -m 644 "${srcdir}"/opt/dsf/sd/sys/* "${pkgdir}"/opt/dsf/sd/sys/
}
