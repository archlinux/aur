# Maintainer: tom barrett <tom at tombarrett dot xyz>
# https://aur.archlinux.org/packages/port-bin/

pkgname=port-bin
pkgver=1.7.1
pkgrel=1
pkgdesc="A ship runner and manager for Urbit OS"
arch=("x86_64")
url="https://github.com/urbit/port"
license=("MIT" "custom:chromium")
source=("https://github.com/urbit/port/releases/download/v${pkgver}/port-linux-x64-${pkgver}.zip")
sha512sums=("0acc90c0e829943c4190f160d7e9507e5fcb8ff778abc09cf8fba3bf7224dadee1ab011617b648379758aeaedac8e88a416052c7b2792a98cbb2b943302ebde6")

conflicts=("port")

package() {
	install -d -m755 "$pkgdir"/usr/bin
	install -d -m755 "$pkgdir"/usr/share/port
	cp -r "$srcdir"/port-linux-x64/* "$pkgdir"/usr/share/port
	ln -s /usr/share/port/port "$pkgdir"/usr/bin/port
}
