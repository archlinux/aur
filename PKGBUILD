# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=reprapfirmware-bin
pkgver=1.2.3.0
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
install="${pkgname}.install"
source=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/reprapfirmware_${pkgver}-1_all.deb")
md5sums=('e8fa7285dcf193ccf42f401de083739e')
sha1sums=('8c72bae4724aed7b681cd000184bea5404f8d456')
sha256sums=('3b84763538f4763ff4485122b950a11765939d94006afaf78861d606056840c1')
sha512sums=('6dbb045cd00290148f2bc4860295cdbf57a5ab34536f4549e7d18c194e86955f0aa8435501acef889c37b9466c8a402741b599e67cfbd1efbdf4d72d30d1cab9')

prepare() {
    tar -xf data.tar.xz
}

package() {
	# Virtual SD Card
	install -dm 755 "${pkgdir}"/opt/dsf/sd/sys
	install -m 644 "${srcdir}"/opt/dsf/sd/sys/* "${pkgdir}"/opt/dsf/sd/sys/
}
