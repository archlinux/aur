# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=reprapfirmware-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="RepRapFirmware Software Bundle"
arch=('any')
url="https://github.com/Duet3D/RepRapFirmware.git"
license=('GPL3')
provides=("reprapfirmware=${pkgver}")
conflicts=("reprapfirmware")
depends=("duetsoftwareframework>=${pkgver}" 'duetcontrolserver>=1.2.0.0' 'duetsd>=1.0.5')
backup=(
	'opt/dsf/sd/sys/Duet2_SBCiap32_SBC.bin'
	'opt/dsf/sd/sys/Duet2_SBCiap_2SBC.bin'
	'opt/dsf/sd/sys/Duet2Firmware_SBC.bin'
	'opt/dsf/sd/sys/Duet3_SBCiap32_MB6HC.bin'
	'opt/dsf/sd/sys/Duet3_SBCiap32_Mini5plus.bin'
	'opt/dsf/sd/sys/Duet3_SBCiap_MB6HC.bin'
	'opt/dsf/sd/sys/Duet3_SBCiap_Mini5plus.bin'
	'opt/dsf/sd/sys/Duet3Bootloader_EXP.bin'
	'opt/dsf/sd/sys/Duet3Bootloader_TOOL.bin'
	'opt/dsf/sd/sys/Duet3Firmware_EXP1XD.bin'
	'opt/dsf/sd/sys/Duet3Firmware_EXP3HC.bin'
	'opt/dsf/sd/sys/Duet3Firmware_MB6HC.bin'
	'opt/dsf/sd/sys/Duet3Firmware_Mini5plus.uf2'
	'opt/dsf/sd/sys/Duet3Firmware_TOOL1LC.bin'
)
source=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/reprapfirmware_${pkgver//_/-}-${pkgrel}_all.deb")
md5sums=('238e6baf0540a0abd2c71a8bdab249f5')
sha1sums=('67e5b9f491bb8122b9d0e3eafb1475a65ca912f8')
sha256sums=('2d7b47367953aa9e965c59df75c4285e71b949d2df9d75eeb675604af9b8d5fa')
sha512sums=('49cc0add8109380a372b0f538552760c677b4b3eef68f2019c030f646f82042581237cc4e171e6952b6e08bea949fbc903ff4a25d9e63cdf478953c5b9e15bdd')

prepare() {
    tar -xf data.tar.xz
}

package() {
	# Virtual SD Card
	install -dm 755 "${pkgdir}"/opt/dsf/sd/sys
	install -m  644 -o dsf -g dsf "${srcdir}"/opt/dsf/sd/sys/* "${pkgdir}"/opt/dsf/sd/sys/
}
