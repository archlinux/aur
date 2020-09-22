# Maintainer: Jiří Prokop <jprokop@synaptiko.cz>

pkgname=zsa-wally-cli
pkgver=1.1.1
pkgrel=3
pkgdesc="Wally: Flash your ZSA Keyboard the EZ way."
arch=('i686' 'x86_64')
url="https://github.com/zsa/wally"
license=('MIT')
depends=('libusb')
provides=('wally-cli')
source=('https://github.com/zsa/wally/releases/download/1.1.1-linux/wally-cli'
	'50-wally-cli.rules'
)
sha256sums=('b968aeba6f17d0873b26371307179dc02cd360a4cfa74732ab5c814607479d82'
	'SKIP'
)

package() {
	install -Dm644 50-wally-cli.rules "$pkgdir"/etc/udev/rules.d/50-wally-cli.rules
	install -Dm755 wally-cli "$pkgdir"/usr/bin/wally-cli
}
