# Maintainer: Gabriel Cangussu <gabrielcangussu g-mail>
# Maintainer: Pedro Henrique Quitete Barreto <pedrohqb g-mail>
pkgname=lacuna-webpki
pkgver=2.13.3
pkgrel=2
pkgdesc="The Lacuna WebPKI native application. An easy solution for using digital certificates in Web applications."
arch=('x86_64')
url="http://webpki.lacunasoftware.com"
license=('unknown')
depends=('desktop-file-utils' 'glib2' 'gtk3>=3.6' 'hicolor-icon-theme' 'xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://get.webpkiplugin.com/Downloads/${pkgver}/setup-deb-64")
sha512sums_x86_64=('fff95b9411aacc894cc5f321846f279e4822477eda11f3aae54f8883e33b2a163435b3f4f21120e0fdbd3fec2014d05d4c424ba5a560482e530feedc31d9d2d1')

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
