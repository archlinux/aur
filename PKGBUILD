# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=broadcom-bt-firmware
pkgver=12.0.1.1105
_pkgver='12.0.1.1105_p4'
pkgrel=1
pkgdesc='Firmware for Broadcom Bluetooth devices'
arch=('x86_64')
url="https://github.com/winterheart/${pkgname}"
license=(
	'custom'
	'MIT'
)
source=("${url}/releases/download/v${_pkgver}/${pkgname}-${pkgver}.deb")
conflicts=("${pkgname}-git")
b2sums=('13dc60bfa9514afe711261f242d617d65329fcf7a0cc5b17208963d18511703ef7ec7575e75ee0bb3b2b5c5755e14ecb408dabe1c6a7cf6786bfd1a3e403ea01')

package() {
	mkdir "${pkgdir}/usr" \
	&& tar \
		--extract \
		--file data.tar.gz \
		--directory "${pkgdir}" \
	&& mv "${pkgdir}/lib" "${pkgdir}/usr"
}
