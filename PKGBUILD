# Maintainer: Stezko <stezko@gmail.com>
# Contributor: SAFIB LTD <service.assist@safib.ru>

pkgname=assistant
pkgver=6.4.0
pkgrel=1
_pkg=1318
pkgdesc='Secure remote access to computers over a local network or over the Internet.'
arch=('x86_64')
license=('custom:SAFIB LTD')
url="https://xn--80akicokc0aablc.xn--p1ai/"
depends=('bash' 'desktop-file-utils' 'gtk2' 'hicolor-icon-theme' 'v4l-utils')
options=('!strip')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.deb::${url}%D1%81%D0%BA%D0%B0%D1%87%D0%B0%D1%82%D1%8C/Download/${_pkg}"
#	"https://archive.archlinux.org/packages/l/libtiff/libtiff-4.5.0-4-x86_64.pkg.tar.zst"
	)
md5sums=('D4B5EBBFC53B9190E56DEB74063F1A9C'
#	 'f06d9d5070038b0dc84b0bdfc8cf37b8'
	 )

#build() {
#	bsdtar xf libtiff-4.5.0-4-x86_64.pkg.tar.zst
#}
package() {
	bsdtar xf data.tar.gz -C "${pkgdir}"
#	cp "${srcdir}/usr/lib/libtiff.so.6.0.0" "${pkgdir}/opt/${pkgname}/lib/libtiff.so.6"
	install -D -m644 "${pkgdir}/opt/${pkgname}/license/License.rtf" "${pkgdir}/usr/share/licenses/${pkgname}/License.rtf"
	install -D -m644 "${pkgdir}/opt/${pkgname}/scripts/${pkgname}.desktop" "${pkgdir}/usr/share/applications/remote-${pkgname}.desktop"
	install -D -m644 "${pkgdir}/opt/${pkgname}/scripts/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
