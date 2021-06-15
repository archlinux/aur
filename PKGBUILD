# Maintainer: tom barrett <tom at tombarrett dot xyz>
# https://aur.archlinux.org/packages/port-bin/

pkgname=port-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A ship runner and manager for Urbit OS"
arch=("x86_64")
url="https://github.com/arthyn/port"
license=("MIT" "custom:chromium")
source=("https://github.com/arthyn/port/releases/download/v${pkgver}/port-linux-x64-${pkgver}.zip")
sha512sums=("cf2cc8145f707e9d63f6dff86528db7d643b675008d32df043c5f58a6fb323fd491ffb9d815575207bfbe9e79c86827c65be3702641933f94884c7fb429d2477")
conflicts=("port")

package() {
	install -d -m755 "$pkgdir"/usr/bin
	install -d -m755 "$pkgdir"/usr/share/port
	cp -r "$srcdir"/port-linux-x64/* "$pkgdir"/usr/share/port
	ln -s /usr/share/port/port "$pkgdir"/usr/bin/port
}
