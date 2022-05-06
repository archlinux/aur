# Maintainer: Gabriel Cangussu <gabrielcangussu g-mail>
pkgname=lacuna-webpki
pkgver=2.11.8
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
sha512sums_x86_64=('fce3e35c6184bd6ab1a53d95ce0e8f04a3a30a1bc0f3011c52db921694d5311c63564e58b9b4b60b9b5ab6d6430e1438b1e16cde157991dc61b6babe66567d7f')

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
