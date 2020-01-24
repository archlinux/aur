# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=reprapfirmware-bin
pkgver=1.2.4.0
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
	'opt/dsf/sd/sys/Duet3_SBCiap_MBP05.bin'
	'opt/dsf/sd/sys/Duet3Bootloader_EXP.bin'
	'opt/dsf/sd/sys/Duet3Bootloader_TOOL.bin'
	'opt/dsf/sd/sys/Duet3Firmware_EXP3HC.bin'
	'opt/dsf/sd/sys/Duet3Firmware_MB6HC.bin'
	'opt/dsf/sd/sys/Duet3Firmware_MBP05.bin'
	'opt/dsf/sd/sys/Duet3iap_spi_MB6HC.bin'
	'opt/dsf/sd/sys/Duet3iap_spi_MBP05.bin'
)
install="${pkgname}.install"
source=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/reprapfirmware_${pkgver}-1_all.deb")
md5sums=('06fa9fc3377679375dc61c10d7d80623')
sha1sums=('ef1200e7366d18198c798b2d0def6358353de747')
sha256sums=('95d8291832a79517401235cae872d234e406f34cf8f5356158da481740402a39')
sha512sums=('a4daccfb9ea7d53d50d32961ef2a6859db14094ace5d76ff47b490f404d7ec774f7dd9cec8e1fd3c99f1a49c227a938e352592ba08d47e9a435de8f7ad3e5446')

prepare() {
    tar -xf data.tar.xz
}

package() {
	# Virtual SD Card
	install -dm 755 "${pkgdir}"/opt/dsf/sd/sys
	install -m 644 "${srcdir}"/opt/dsf/sd/sys/* "${pkgdir}"/opt/dsf/sd/sys/
}
