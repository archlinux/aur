# Maintainer: KUHTOXO oxomhuk@gmail.com
pkgname=armgs
pkgver=23.2
pkgrel=3
pkgdesc="ARM GS"
arch=('x86_64')
url="https://armgs.team/"
license=('proprietary')
options=(!strip)

_install_path="/opt/${pkgname}"
_archive_name="${pkgname}.tar.xz"
_app_name="sreda.tar.xz"

source=(
	"https://dl.armgs.team/downloads/linux/x64/latest/${_app_name}"
	"armgs.desktop"
)
#noextract=()
sha256sums=(
	'1b087e5b4f0b76f748d7f144eab2f3ae2585d323939dac4e8b8dd4e6faf9ed17'
	'83d954aa581fb9a4f3f9675512ad4a19bbe62fef203d523125601108decdf4c3'
)

package() {
	mkdir -p "${pkgdir}/opt/${pkgname}"
	cp -a "${srcdir}/." "${pkgdir}${_install_path}/"
	rm "${pkgdir}${_install_path}/${_app_name}"
	mkdir -p "${pkgdir}/usr/share/applications/"
	cp -L "armgs.desktop" "${pkgdir}/usr/share/applications/armgs.desktop"
	rm "${pkgdir}/opt/armgs/armgs.desktop"
}