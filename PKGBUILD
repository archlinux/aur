# Maintainer: Gabriel Cangussu <gabrielcangussu g-mail>
pkgname=lacuna-webpki
pkgver=2.10.0
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
sha512sums_x86_64=('bf0db6969f819a836bfd3deaa9839608f3da00ee6aa50b8df8397f7b3896a27df3c7a23fc82a0a36d3334f4b0feb5c06955b3f8ee3280195da3673f431126067')

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
