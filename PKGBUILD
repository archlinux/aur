# Maintainer: tom barrett <tom at tombarrett dot xyz>
# https://aur.archlinux.org/packages/port-bin/

pkgname=port-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="A ship runner and manager for Urbit OS"
arch=("x86_64")
url="https://github.com/urbit/port"
license=("MIT" "custom:chromium")
source=("https://github.com/urbit/port/releases/download/v${pkgver}/port-linux-x64-${pkgver}.zip")
sha512sums=("fe87288b811f2e5d24e52f1ab0ddfcc8f4524fdc88ed8c8e4ad3ed988b47358d7490d3f2f66e69e97be4579cd5e6ac23bf311062cd9031c7fc4318497df07373")
conflicts=("port")

package() {
	install -d -m755 "$pkgdir"/usr/bin
	install -d -m755 "$pkgdir"/usr/share/port
	cp -r "$srcdir"/port-linux-x64/* "$pkgdir"/usr/share/port
	ln -s /usr/share/port/port "$pkgdir"/usr/bin/port
}
