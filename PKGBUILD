# Maintainer: Gabriel Cangussu <gabrielcangussu g-mail>
pkgname=lacuna-webpki
pkgver=2.12.1
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
sha512sums_x86_64=('da44010447d3cf44281d76c31238f672629123708143f8ad7c6dd2db304d512ce96a5950cc9bb01ef52eee3a4cd32732b8131c4de0a1deade67b3a72146e5ffb')

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
