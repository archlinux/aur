# Maintainer: tom barrett <tom at tombarrett dot xyz>
# https://aur.archlinux.org/packages/port-bin/

pkgname=port-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="A ship runner and manager for Urbit OS"
arch=("x86_64")
url="https://github.com/urbit/port"
license=("MIT" "custom:chromium")
source=("https://github.com/urbit/port/releases/download/v${pkgver}/port-linux-x64-${pkgver}.zip")
sha512sums=("f31be4eb6757a9732233bbe8e30184cd8b2934ba05716941d7fe71a8cfe859cf11fe0479d657dcca776afd1b19b6fc9999c34ad2cd1274a9385491a02d3eaa3c")

conflicts=("port")

package() {
	install -d -m755 "$pkgdir"/usr/bin
	install -d -m755 "$pkgdir"/usr/share/port
	cp -r "$srcdir"/port-linux-x64/* "$pkgdir"/usr/share/port
	ln -s /usr/share/port/port "$pkgdir"/usr/bin/port
}
