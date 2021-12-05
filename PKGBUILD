# Maintainer: Gabriel Cangussu <gabrielcangussu g-mail>
pkgname=lacuna-webpki
pkgver=2.11.6
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
sha512sums_x86_64=('d32d494ae58d306164499ad9c8c956edb4d6126024d037827befe867563fe0eed255a06f10c1941062394cc9a2779eb5324da0acc572eefa9eb7000651b5b5ab')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directories structure differences
	cd "${pkgdir}"
	rm -rf usr/lib64
	rm -rf usr/share
	cd ..

	# Fix permissions
	chmod -R 755 "${pkgdir}"
}
