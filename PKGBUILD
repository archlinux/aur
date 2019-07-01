# Maintainer: Jiří Prokop <jprokop@synaptiko.cz>

pkgname=zsa-wally
pkgver=1.0.0
pkgrel=1
pkgdesc="Wally: Flash your ZSA Keyboard the EZ way."
arch=('i686' 'x86_64')
url="https://github.com/zsa/wally"
license=('MIT')
depends=('gtk3' 'webkit2gtk' 'libusb')
provides=('wally' 'wally-cli')
source=('https://github.com/zsa/wally/releases/download/1.0.0/wally-linux.zip'
	'50-wally.rules'
)
sha256sums=('3aabb326f8a25537042be1a7c7e79dd462a51ae7d8c3060d209d8132c96f555e'
	'SKIP'
)

package() {
	install -Dm644 50-wally.rules "$pkgdir"/etc/udev/rules.d/50-wally.rules
	install -Dm755 wally "$pkgdir"/usr/bin/wally
	install -Dm755 wally-cli "$pkgdir"/usr/bin/wally-cli
}
