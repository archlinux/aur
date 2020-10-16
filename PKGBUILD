# Maintainer: Christopher Fair <christopherpfair@comcast.net>

pkgname=zsa-wally
pkgver=2.1.0
pkgrel=10
srcRepo="https://github.com/zsa/wally/raw/${pkgver}-linux"
srcRepoExp="${srcRepo}/dist/linux64"
pkgdesc="Wally: Flash your ZSA Keyboard the EZ way."
arch=('i686' 'x86_64')
url="https://github.com/zsa/wally"
license=('MIT')
depends=('gtk3' 'webkit2gtk' 'libusb')
provides=('wally')
source=("https://github.com/zsa/wally/releases/download/${pkgver}-linux/wally"
    "${srcRepo}/appicon.png"
    "${srcRepoExp}/50-wally.rules"
    "${srcRepoExp}/wally.desktop"
)
sha256sums=('cdb168899d4e3a81eddfcfa7746d1e4e0dab886ea043644e54339b51f396c087'
            '81df9f24859cfd19ee8128d74a72155fe222e33349c9a647da98922f3f5b7857'
            '269c9196bc65b2e62be549e3d34e56768fe702ff099b7780a1661ca4c92a0143'
            'd769c63305a6a4f5aa1d661826d8c475014ef8b456e60074596e940e7901c130'
            )

package() {
    install -Dm644 appicon.png "$pkgdir/usr/share/pixmaps/wally.png"
    install -Dm755 wally "$pkgdir/usr/bin/wally"
    install -Dm644 50-wally.rules "$pkgdir/etc/udev/rules.d/50-wally.rules" 
    install -Dm644 wally.desktop "$pkgdir/usr/share/applications/wally.desktop" 
}
