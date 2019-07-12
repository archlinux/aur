# Maintainer: Jiří Prokop <jprokop@synaptiko.cz>

pkgname=zsa-wally
pkgver=1.1.0
pkgrel=1
pkgdesc="Wally: Flash your ZSA Keyboard the EZ way."
arch=('i686' 'x86_64')
url="https://github.com/zsa/wally"
license=('MIT')
depends=('gtk3' 'webkit2gtk' 'libusb')
provides=('wally' 'wally-cli')
source=('https://github.com/zsa/wally/releases/download/1.1.0-linux/wally'
	'https://github.com/zsa/wally/releases/download/1.1.0-linux/wally-cli'
	'50-wally.rules'
)
sha256sums=('b644601905cf3020df73a806b7d4c5844fae2eccafb6a8b26dded9b97b243c1c'
	'6829c93652ffe9e3546ed3187c957caf06105a3c84ddd4ff6a6197e92d27c441'
	'SKIP'
)

package() {
	install -Dm644 50-wally.rules "$pkgdir"/etc/udev/rules.d/50-wally.rules
	install -Dm755 wally "$pkgdir"/usr/bin/wally
	install -Dm755 wally-cli "$pkgdir"/usr/bin/wally-cli
}
