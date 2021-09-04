# Maintainer: slimb

pkgname=zsa-wally-bin
pkgver=2.1.3
pkgrel=1
pkgdesc='Flash your ZSA Keyboard the EZ way.'
arch=('i686' 'x86_64')
url='https://github.com/zsa/wally'
license=('MIT')
depends=('gtk3' 'webkit2gtk' 'libusb')
provides=('wally')
conflicts=('zsa-wally')
source=("https://github.com/zsa/wally/releases/download/${pkgver}-linux/wally"
        "https://github.com/zsa/wally/raw/${pkgver}-linux/appicon.png"
        "https://github.com/zsa/wally/raw/${pkgver}-linux/license.md"
        "https://github.com/zsa/wally/raw/${pkgver}-linux/dist/linux64/50-wally.rules"
        "https://github.com/zsa/wally/raw/${pkgver}-linux/dist/linux64/50-oryx.rules"
        "https://github.com/zsa/wally/raw/${pkgver}-linux/dist/linux64/wally.desktop")

sha256sums=('a30c974c2fd544975e48f7f2ac99a21f936fa3e0803afeeb1096826a79afdbde'
            '81df9f24859cfd19ee8128d74a72155fe222e33349c9a647da98922f3f5b7857'
            'd2841d63f4e0bdfda102390ab1ca09136230d22f88538863b24b0c7fc68e548e'
            '05d3e9ef60fe6e18f245457a341db9d84b4c8d81b66da1f061405f3b11d9cd58'
            '2d33fa2da9e757ac3b66a3a6d4f11e08b541847c26573d917108a306cc6e3998'
            '6bd731e8b34dac1995ba9a60312be598d70d7322a7021ef93378c9cb47025d1f')

package() {
    install -Dm755 wally "$pkgdir/usr/bin/wally"
    install -Dm644 -t "$pkgdir/usr/lib/udev/rules.d/" 50-oryx.rules 50-wally.rules
    install -Dm644 wally.desktop "$pkgdir/usr/share/applications/wally.desktop"
    install -Dm644 appicon.png "$pkgdir/usr/share/pixmaps/wally.png"
    install -Dm644 license.md "$pkgdir/usr/share/licenses/$pkgname/license.md"
}
