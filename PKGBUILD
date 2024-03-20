# Maintainer: Stezko <stezko@gmail.com>
# Contributor: SAFIB LTD <service.assist@safib.ru>

pkgname=assistant
pkgver=5.6.2
pkgrel=1
_pkg=972
pkgdesc='Secure remote access to computers over a local network or over the Internet.'
_pkgdesc_ru='Удобный инструмент для безопасного удаленного доступа и решения задач.'
arch=('x86_64')
license=('custom:SAFIB LTD')
url="https://xn--80akicokc0aablc.xn--p1ai/"
depends=('bash' 'gtk2' 'gtk-engine-murrine')
options=('!strip')
install=${pkgname}.install
source=(${url}%D1%81%D0%BA%D0%B0%D1%87%D0%B0%D1%82%D1%8C/Download/${_pkg})
md5sums=('8BCB7690394CA23CFBFA4DBB93BE257E')

package() {
	sh "${_pkg}" --tar -xvf
	mkdir ${pkgdir}/opt
	tar -C ${pkgdir}/opt/ -xvf ${pkgname}.tar.gz 
	install -Dm644 ${pkgdir}/opt/${pkgname}/license/License.rtf "$pkgdir/usr/share/licenses/${pkgname}/License.rtf"

}
