# Maintainer: tom barrett <tom at tombarrett dot xyz>
# https://aur.archlinux.org/packages/port-bin/

pkgname=port-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="A ship runner and manager for Urbit OS"
arch=("x86_64")
url="https://github.com/arthyn/port"
license=("MIT" "custom:chromium")
source=("https://github.com/arthyn/port/releases/download/v${pkgver}/port-linux-x64-${pkgver}.zip")
sha512sums=("1f1a6475d7f04844ba331caef592c52468acfc266ab6eb36b0b094f9ccf98a35c95bdc553a7a4f29dab98b6cbed15725f17fb570218d7517a515914ba11786af")
conflicts=("port")

package() {
	install -d -m755 "$pkgdir"/usr/bin
	install -d -m755 "$pkgdir"/usr/share/port
	cp -r "$srcdir"/port-linux-x64/* "$pkgdir"/usr/share/port
	ln -s /usr/share/port/port "$pkgdir"/usr/bin/port
}
