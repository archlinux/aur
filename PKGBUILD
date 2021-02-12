# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=reprapfirmware-bin
pkgver=3.2.2
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
md5sums=('64cdd1398670ad9f3fcd3b4510f10571')
sha1sums=('1b007d543c2230f2733e0877748ebec1ae8fa225')
sha256sums=('1bd7cea42bb51c630430f51a5d9321ef2a53e9315e8b61cc339c4580e8c6910d')
sha512sums=('91e62d1510ac5c6f5b408f3cf43afd66bc2fbeb59fd0df6a0cc849eb701605a21bd41e773fb926eced1fc06d6cc87ee7f2831d5f28c349f201914398cac968bc')

prepare() {
    tar -xf data.tar.xz
}

package() {
	# Virtual SD Card
	install -dm 755 "${pkgdir}"/opt/dsf/sd/sys
	install -m  644 -o dsf -g dsf "${srcdir}"/opt/dsf/sd/sys/* "${pkgdir}"/opt/dsf/sd/sys/
}
