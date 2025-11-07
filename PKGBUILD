# Maintainer: Stezkoy

pkgname=assistant
pkgver=6.5.0
pkgrel=2
_pkg=1375
pkgdesc='Secure remote access to computers over a local network or over the Internet.'
arch=('x86_64')
license=('custom:SAFIB LTD')
url="https://xn--80akicokc0aablc.xn--p1ai/"
depends=('bash' 'desktop-file-utils' 'gtk2' 'hicolor-icon-theme' 'v4l-utils')
options=('!strip')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.deb::${url}%D1%81%D0%BA%D0%B0%D1%87%D0%B0%D1%82%D1%8C/Download/${_pkg}")
md5sums=('9c2110452399997ae52df0c776b7dab2')
package() {
	bsdtar xf data.tar.gz -C "${pkgdir}"
	install -D -m644 "${pkgdir}/opt/${pkgname}/license/License.rtf" "${pkgdir}/usr/share/licenses/${pkgname}/License.rtf"
	install -D -m644 "${pkgdir}/opt/${pkgname}/scripts/${pkgname}.desktop" "${pkgdir}/usr/share/applications/remote-${pkgname}.desktop"
	install -D -m644 "${pkgdir}/opt/${pkgname}/scripts/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
