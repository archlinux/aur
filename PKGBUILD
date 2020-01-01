# Maintainer: Daniel Milde <daniel@milde.cz>
pkgname=jaxx
pkgver=2.3.6
pkgrel=1
pkgdesc="Multi-chain cryptocurrency wallet"
arch=('x86_64')
url="https://jaxx.io/"
license=('proprietary')
options=(!strip)
source=("https://download-liberty.jaxx.io/Jaxx.Liberty-${pkgver}.AppImage" jaxx.png jaxx.desktop)
sha256sums=('27cb3c55be2f5b7922bb1d3bee0af4822fe5710081c811cbc74dc5e1b5ec29c4'
            'fdb0004b645930bd22d0e88c266d180fbb2a140a7bd557b464fcbaef77f5e346'
            'e846fe84d904d4a0d4f233b951d598f1d3ebc72ec41f9b32d020d037d9695602')

package() {
        mkdir -p $pkgdir/opt/$pkgname
        install -Dm755 Jaxx.Liberty-${pkgver}.AppImage "$pkgdir/opt/$pkgname/Jaxx.Liberty-${pkgver}.AppImage"
	install -Dm644 jaxx.png "$pkgdir/opt/$pkgname/jaxx.png"
	install -Dm644 jaxx.desktop "$pkgdir/usr/share/applications/jaxx.desktop"

        mkdir -p "$pkgdir/usr/bin"
        ln -s /opt/$pkgname/Jaxx.Liberty-${pkgver}.AppImage "$pkgdir/usr/bin/$pkgname"
}
