# Maintainer: Gabriel Cangussu <gabrielcangussu g-mail>
# Maintainer: Pedro Henrique Quitete Barreto <pedrohqb g-mail>
pkgname=lacuna-webpki
pkgver=2.15.0
pkgrel=1
pkgdesc="The Lacuna WebPKI native application. An easy solution for using digital certificates in Web applications."
arch=('x86_64')
url="https://lacunasoftware.com"
license=('unknown')
depends=('xdg-utils' 'icu')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://get.webpkiplugin.com/Downloads/${pkgver}/setup-deb-64")
sha512sums_x86_64=('e70b1220cb4fec43195ddfddbfc4bdd395c09a51fe913348f90d38592b657bbe9f4259a630f134f8e282542ab692dcb97dd0507175e74dd18d1b906c61b465ae')

package(){
	# Extract package data
	tar xf data.tar.zst -C "${pkgdir}"

	# Remove duplicates provided by other packages
	rm -rf "${pkgdir}/usr/lib64"

	# Fix permissions
	find "${pkgdir}" -type d -exec chmod 755 {} +
	find "${pkgdir}" -type f -exec chmod 644 {} +
	chmod 755 "${pkgdir}/opt/lacuna-webpki/webpki"
}
