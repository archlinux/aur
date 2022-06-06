# Maintainer: tom barrett <tom at tombarrett dot xyz>
# https://aur.archlinux.org/packages/port-bin/

pkgname=port-bin
pkgver=1.9.0
pkgrel=1
pkgdesc="A ship runner and manager for Urbit OS"
arch=("x86_64")
url="https://github.com/urbit/port"
license=("MIT" "custom:chromium")
source=("https://github.com/urbit/port/releases/download/v${pkgver}/port-linux-x64-${pkgver}.zip")
sha512sums=("6fe615fc3498d167dbef651455e336e3aec885de1350d1fc9281d815c2d42e7b004b132c2967df29c33440bb4c330606c13b24dbb56758a096a274b3c7cd50f5")

conflicts=("port")

package() {
	install -d -m755 "$pkgdir"/usr/bin
	install -d -m755 "$pkgdir"/usr/share/port
	cp -r "$srcdir"/port-linux-x64/* "$pkgdir"/usr/share/port
	ln -s /usr/share/port/port "$pkgdir"/usr/bin/port
}
