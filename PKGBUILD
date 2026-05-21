# Maintainer: Yakov P potapovj(at)gmail(dot)com
# Maintainer: KUHTOXO https://aur.archlinux.org/account/kuhtoxo
pkgname=sreda
pkgver=26.1.10.85335
pkgrel=1
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
sha256sums=('74c29b8bd1b5322d9784c73c221a948f6af30f788649654837c8f18bac0aecc1'
            '4cd9a7f70e029a3501af880f4839ad1a52de104ad989e1b0aa1817bfa90675aa')

package() {
	mkdir -p "${pkgdir}/opt/${pkgname}"
	cp -a "${srcdir}/." "${pkgdir}${_install_path}/"
	rm "${pkgdir}${_install_path}/${pkgname}-${pkgver}.tar.xz"
	mkdir -p "${pkgdir}/usr/share/applications/"
	cp -L "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	rm "${pkgdir}/opt/${pkgname}/${pkgname}.desktop"
}
