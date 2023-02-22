# Maintainer: Gabriel Cangussu <gabrielcangussu g-mail>
# Maintainer: Pedro Henrique Quitete Barreto <pedrohqb@gmail.com>
pkgname=lacuna-webpki
pkgver=2.13.2
pkgrel=1
pkgdesc="The Lacuna WebPKI native application. An easy solution for using digital certificates in Web applications."
arch=('x86_64')
url="http://webpki.lacunasoftware.com"
license=('unknown')
groups=('')
depends=('desktop-file-utils' 'glib2' 'gtk3>=3.6' 'hicolor-icon-theme' 'xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://get.webpkiplugin.com/Downloads/${pkgver}/setup-deb-64")
sha512sums_x86_64=('9231bc195d791436a0f9a4615400daae7dbdc33e63516fd68e087c5c5812a1aa26cdd4de347785fdfa40cb3b4363dd85686283e96c21d50e8143b5e07a364a1a')

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
