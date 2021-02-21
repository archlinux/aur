# Maintainer: Jiří Prokop <jprokop@synaptiko.cz>

pkgname=zsa-wally-cli
pkgver=2.0.0
pkgrel=3
pkgdesc="Wally: Flash your ZSA Keyboard the EZ way."
arch=('i686' 'x86_64')
url="https://github.com/zsa/wally-cli"
license=('MIT')
depends=('libusb')
provides=('wally-cli')
source=("wally-cli-$pkgver-$pkgrel::https://github.com/zsa/wally-cli/releases/download/2.0.0-linux/wally-cli"
	'50-wally-cli.rules'
)
sha256sums=('a38f731cc1a89d32a5cb9e377d2ec24280cb5d2fc0b34b1cb05464305fb38800'
	'SKIP'
)

package() {
	install -Dm644 50-wally-cli.rules "$pkgdir"/usr/lib/udev/rules.d/50-wally-cli.rules
	install -Dm755 wally-cli-$pkgver-$pkgrel "$pkgdir"/usr/bin/wally-cli
}
