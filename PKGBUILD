# Maintainer: tom barrett <tom at tombarrett dot xyz>
# https://aur.archlinux.org/packages/port-bin/

pkgname=port-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="A ship runner and manager for Urbit OS"
arch=("x86_64")
url="https://github.com/urbit/port"
license=("MIT" "custom:chromium")
source=("https://github.com/urbit/port/releases/download/v${pkgver}/port-linux-x64-${pkgver}.zip")
sha512sums=("16650be2a8784032b23bf249fc529d8b39e12743e6a062b96da049e996ea32d3ec372201900dbcc811fb89c2973d11e182abce03dc667ccc3c385a4fde0778c4")
conflicts=("port")

package() {
	install -d -m755 "$pkgdir"/usr/bin
	install -d -m755 "$pkgdir"/usr/share/port
	cp -r "$srcdir"/port-linux-x64/* "$pkgdir"/usr/share/port
	ln -s /usr/share/port/port "$pkgdir"/usr/bin/port
}
