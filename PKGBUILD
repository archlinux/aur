# Maintainer: Stezkoy

pkgname=assistant
pkgver=7.0.0
pkgrel=1
_pkg=1514
pkgdesc='Secure remote access to computers over a local network or over the Internet.'
arch=('x86_64')
license=('custom:SAFIB LTD')
url="https://xn--80akicokc0aablc.xn--p1ai/"
depends=('bash' 'desktop-file-utils' 'gtk2' 'hicolor-icon-theme' 'v4l-utils')
options=('!strip')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.deb::https://lk3.xn--80akicokc0aablc.xn--p1ai/WebApi/Platforms/Download/${_pkg}")
md5sums=('c89ea1d270e42879b1cf7539be41d5bc')
package() {
	bsdtar xf data.tar.gz -C "${pkgdir}"
	install -D -m644 "${pkgdir}/opt/${pkgname}/license/License.rtf" "${pkgdir}/usr/share/licenses/${pkgname}/License.rtf"
	install -D -m644 "${pkgdir}/opt/${pkgname}/scripts/${pkgname}.desktop" "${pkgdir}/usr/share/applications/remote-${pkgname}.desktop"
	install -D -m644 "${pkgdir}/opt/${pkgname}/scripts/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
