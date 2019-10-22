# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=reprapfirmware-bin
pkgver=1.1.0.5
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
)
source=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/reprapfirmware_${pkgver}-1_all.deb")
sha256sums=('cde1e2212faad71ecfaf6e49b24c4eb32a0a4ddfeb3b2c7c24bfb66ebb13f6a2')

prepare() {
    tar -xf data.tar.xz
}

package() {
	# Virtual SD Card
	install -dm 755 "${pkgdir}"/opt/dsf/sd/sys
	install -m 644 "${srcdir}"/opt/dsf/sd/sys/* "${pkgdir}"/opt/dsf/sd/sys/
}
