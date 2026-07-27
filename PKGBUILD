# Maintainer: Gabriel Cangussu <gabrielcangussu g-mail>
# Maintainer: Pedro Henrique Quitete Barreto <pedrohqb g-mail>
pkgname=lacuna-webpki
pkgver=2.16.0
pkgrel=1
pkgdesc="The Lacuna WebPKI native application. An easy solution for using digital certificates in Web applications."
arch=('x86_64')
url="https://lacunasoftware.com"
license=('unknown')
depends=('xdg-utils' 'icu')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://get.webpkiplugin.com/Downloads/${pkgver}/setup-deb-64")
sha512sums_x86_64=('ee0efdd4201a07af45aec7a967e89c40f0cb098188f3f467ae7dda8b46b7b383b903e9f31336a2b458d4db39eea6786a57f4c8c65ce75619587d7e5c98c405d4')

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
