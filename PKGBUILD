# Maintainer: Yakov P potapovj(at)gmail(dot)com
pkgname=sreda
pkgver=24.5.0
pkgrel=3
pkgdesc="SREDA"
arch=('x86_64')
url="https://sreda.digital.gov.ru/"
license=('proprietary')
options=(!strip)

_install_path="/opt/${pkgname}"
_archive_name="${pkgname}.tar.xz"
_app_name="${pkgname}.tar.xz"

source=(
	"https://dl.armgs.team/downloads/linux/x64/latest/${_app_name}"
	"sreda.desktop"
)
#noextract=()
sha256sums=(
	'1cf4c77f15b7e1c54faae05c28b0e94e76efdb6b1c29e6b0b2d09095e2d9a209'
	'83d954aa581fb9a4f3f9675512ad4a19bbe62fef203d523125601108decdf4c3'
)

package() {
	mkdir -p "${pkgdir}/opt/${pkgname}"
	cp -a "${srcdir}/." "${pkgdir}${_install_path}/"
	rm "${pkgdir}${_install_path}/${_app_name}"
	mkdir -p "${pkgdir}/usr/share/applications/"
	cp -L "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	rm "${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
}
