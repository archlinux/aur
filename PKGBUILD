# Maintainer: tercean <cg@zknt.org>
pkgname=hyperspace-appimage
pkgver=1.1.4
pkgrel=1
pkgdesc='The new beautiful, fluffy client for Mastodon'
arch=('x86_64')
url='https://hyperspace.marquiskurt.net'
license=('custom:NPL')
provides=('hyperspace')
conflicts=('hyperspace')
depends=('fuse')
options=(!strip)
_appimage="Hyperspace-${pkgver}.AppImage"
source=(
    "Hyperspace-${pkgver}.AppImage::https://github.com/hyperspacedev/hyperspace/releases/download/v${pkgver}/Hyperspace.Desktop-${pkgver}.AppImage"
    "https://raw.githubusercontent.com/hyperspacedev/hyperspace/v${pkgver}/LICENSE.txt"
    "hyperspace.desktop"
    "hyperspace.png"
    )
noextract=("${_appimage}")
sha256sums=('0ffdd8502fb11df68c63df5458c34625e9193a520bda3b2f361f225cff75b823'
            'f49ae3685bf4635b0eb6f07fe684ed1b30f5b2a2c9b5b05b589fb9edfead8d35'
            '3fde38d58daf8e2a15b37c9b9072784619ad037f2df4106c8185729e0d76fb9c'
            '787ce1f36ca0a0b1cee2f0eea59584e59552910ad732b4d8528afa84b950b06e')

package() {
    install -Dm755 $_appimage "$pkgdir"/usr/bin/hyperspace
    chmod +x "${pkgdir}/usr/bin/hyperspace"

    install -Dm644 "hyperspace.desktop"                    "${pkgdir}/usr/share/applications/hyperspace.desktop"
    install -Dm644 "hyperspace.png"                        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/hyperspace.png" 
    install -Dm644 LICENSE.txt                             "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
