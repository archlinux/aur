# Maintainer: Gabriel Cangussu <gabrielcangussu g-mail>
# Maintainer: Pedro Henrique Quitete Barreto <pedrohqb g-mail>
pkgname=lacuna-webpki
pkgver=2.14.0
pkgrel=1
pkgdesc="The Lacuna WebPKI native application. An easy solution for using digital certificates in Web applications."
arch=('x86_64')
url="http://webpki.lacunasoftware.com"
license=('unknown')
depends=('desktop-file-utils' 'glib2' 'gtk3>=3.6' 'hicolor-icon-theme' 'xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://get.webpkiplugin.com/Downloads/${pkgver}/setup-deb-64")
sha512sums_x86_64=('91a8fab1c116b36db84833ef240204a6ed9c6f32a66968a53f6a9a2403e186f0dfac880f67003a16ff3c0e3786ab2728d554514f98cc9f48485ef397c57be7fb')

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
