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
    'aeb6cb2a6a9db56f19023e3dde605256106c193d51e537f99dbb80b365c62443'
    '8dda04163592f848276632623aceedb9ccf13264ef620828b340a8cdf05056cb'
    '179cdd6ec837a9b5a629385bfa111def8b6b2ebc9b5988d3f0d6caed5566b6a5'
)

package() {
    install -Dm644 appicon.png "$pkgdir/usr/share/pixmaps/wally.png"
    install -Dm755 wally "$pkgdir/usr/bin/wally"
    install -Dm644 -t "$pkgdir/etc/udev/rules.d" 50-wally.rules 
    install -Dm644 -t "$pkgdir/usr/share/applications" wally.desktop
}
