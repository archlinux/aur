# Maintainer: Gabriel Cangussu <gabrielcangussu g-mail>
# Maintainer: Pedro Henrique Quitete Barreto <pedrohqb g-mail>
pkgname=lacuna-webpki
pkgver=2.16.1
pkgrel=1
pkgdesc="The Lacuna WebPKI native application. An easy solution for using digital certificates in Web applications."
arch=('x86_64')
url="https://lacunasoftware.com"
license=('unknown')
depends=('xdg-utils' 'icu')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://get.webpkiplugin.com/Downloads/${pkgver}/setup-deb-64")
sha512sums_x86_64=('7592c778d891f4874e2b56cc95147e4c29e0bc2f032598b1d2e393f0ea5cd93e8727a39a09933a07bf192438f1e705a41409a70aa007fcecb3006c9563699e75')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Remove duplicates provided by other packages
	rm -rf "${pkgdir}/usr/lib64"

	# Fix permissions
	find "${pkgdir}" -type d -exec chmod 755 {} +
	find "${pkgdir}" -type f -exec chmod 644 {} +
	chmod 755 "${pkgdir}/opt/lacuna-webpki/webpki"
}
