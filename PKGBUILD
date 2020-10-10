# Maintainer: Christopher Fair <christopherpfair@comcast.net>

pkgname=zsa-wally
pkgver=2.1.0
pkgrel=1
pkgdesc="Wally: Flash your ZSA Keyboard the EZ way."
arch=('i686' 'x86_64')
url="https://github.com/zsa/wally"
license=('MIT')
depends=('gtk3' 'webkit2gtk' 'libusb')
provides=('wally')
source=("https://github.com/zsa/wally/releases/download/${pkgver}-linux/wally"
    "https://github.com/zsa/wally/blob/${pkgver}-linux/appicon.png"
    "https://github.com/zsa/wally/blob/${pkgver}-linux/dist/linux64/50-wally.rules"
    "https://github.com/zsa/wally/blob/${pkgver}-linux/dist/linux64/wally.desktop"
)
sha256sums=('cdb168899d4e3a81eddfcfa7746d1e4e0dab886ea043644e54339b51f396c087'
    '7a14836b492e16f6ebdbda4270379011a91d36f9b337ae6f76473943c3b8b531'
    '287f1391334bdf0c5d65b578db202801de6d1ec9aaca88c9f96f9d8864ccc81f'
    '43fa8aca05679cf43918ef90a7a974642bd2938ad412f49b86c6360eae7df357'
)

package() {
    install -Dm644 appicon.png "$pkgdir/usr/share/pixmaps/wally.png"
    install -Dm755 wally "$pkgdir/usr/bin/wally"
    install -Dm644 -t "$pkgdir/etc/udev/rules.d" 50-wally.rules 
    install -Dm644 -t "$pkgdir/usr/share/applications" wally.desktop
}
