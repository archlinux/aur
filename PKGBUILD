# Maintainer: Gabriel Cangussu <gabrielcangussu g-mail>
# Maintainer: Pedro Henrique Quitete Barreto <pedrohqb g-mail>
pkgname=lacuna-webpki
pkgver=2.14.2
pkgrel=1
pkgdesc="The Lacuna WebPKI native application. An easy solution for using digital certificates in Web applications."
arch=('x86_64')
url="http://webpki.lacunasoftware.com"
license=('unknown')
depends=('desktop-file-utils' 'glib2' 'gtk3>=3.6' 'hicolor-icon-theme' 'xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://get.webpkiplugin.com/Downloads/${pkgver}/setup-deb-64")
sha512sums_x86_64=('9f0eac67622d8bd5bbc87f9f09c7cc488f16f14cfcb91f72636ca55a852e1d74be55326ac1a9bcd7e02b0db95ef3c87450ef68f1ba85c8344326fb8a1730cd00')

package(){
	# Extract package data
	tar xf data.tar.zst -C "${pkgdir}"

	# Fix directories structure differences
	cd "${pkgdir}"
	rm -rf usr/lib64
	rm -rf usr/share
	cd ..

	# Fix permissions
	chmod -R 755 "${pkgdir}"
}
