# Maintainer: Stezko <stezko@gmail.com>
# Contributor: SAFIB LTD <service.assist@safib.ru>

pkgname=assistant
pkgver=5.6
pkgrel=2
pkgdesc='Secure remote access to computers over a local network or over the Internet.'
_pkgdesc_ru='Удобный инструмент для безопасного удаленного доступа и решения задач.'
arch=('x86_64')
license=('custom:SAFIB LTD')
url="https://xn--80akicokc0aablc.xn--p1ai/"
depends=('bash' 'gtk2')
source=(${url}%D1%81%D0%BA%D0%B0%D1%87%D0%B0%D1%82%D1%8C/Download/947)
md5sums=('C6B25F36527E6FB73519D9460FB8EB69')

package() {
	tar xf data.tar.xz -C "${pkgdir}"

	install -Dm644 ${pkgdir}/opt/assistant/license/License.rtf "$pkgdir/usr/share/licenses/$pkgname/License.rtf"
	install -Dm644 ${pkgdir}/opt/assistant/scripts/assistant.desktop "$pkgdir/usr/share/applications/remote-assistant.desktop"
	find "${pkgdir}" -type d -print0 |xargs -0 chmod 755
}
