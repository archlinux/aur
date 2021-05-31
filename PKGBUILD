# Maintainer: tom barrett <tom at tombarrett dot xyz>
# https://aur.archlinux.org/packages/port-bin/

pkgname=port-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="A ship runner and manager for Urbit OS"
arch=("x86_64")
url="https://github.com/arthyn/port"
license=("MIT" "custom:chromium")
source=("https://github.com/arthyn/port/releases/download/v${pkgver}/port-linux-x64-${pkgver}.zip")
sha512sums=("5d24ad79b9feac00235ede42819727223c250b6550d90a16b61bdbebe897231b7e8a4f85ccda7fe8fc7c9fab444a5eb97acadb970d2323539fc4977d9aff523d")
conflicts=("port")

package() {
	install -d -m755 "$pkgdir"/usr/bin
	install -d -m755 "$pkgdir"/usr/share/port
	cp -r "$srcdir"/port-linux-x64/* "$pkgdir"/usr/share/port
	ln -s /usr/share/port/port "$pkgdir"/usr/bin/port
}
