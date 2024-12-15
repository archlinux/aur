# Maintainer: Yakov P potapovj(at)gmail(dot)com
# Maintainer: KUHTOXO oxomhuk@gmail.com
pkgname=sreda
pkgver=24.5.4.48124
pkgrel=3
pkgdesc="Service for interaction between employees in organizations."
arch=('x86_64')
url="https://sreda.digital.gov.ru/"
license=('proprietary')
options=(!strip)
replaces=('armgs')

_install_path="/opt/${pkgname}"
_archive_name="${pkgname}.tar.xz"
_app_name="${pkgname}.tar.xz"

source=(
	"${pkgname}-${pkgver}.tar.xz::https://dl.armgs.team/downloads/linux/x64/${pkgver}/${_app_name}"
	"sreda.desktop"
)
sha256sums=(
	'eb10f019bfd7573d6e6e48f748ce5e68500d52f4f7ac3553008faeeb22312ed2'
	'4cd9a7f70e029a3501af880f4839ad1a52de104ad989e1b0aa1817bfa90675aa'
)

package() {
	mkdir -p "${pkgdir}/opt/${pkgname}"
	cp -a "${srcdir}/." "${pkgdir}${_install_path}/"
	rm "${pkgdir}${_install_path}/${pkgname}-${pkgver}.tar.xz"
	mkdir -p "${pkgdir}/usr/share/applications/"
	cp -L "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	rm "${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
}
