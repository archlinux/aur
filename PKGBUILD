# Maintainer: tercean <cg@zknt.org>
pkgname=hyperspace-appimage
pkgver=1.0.0
pkgrel=1
pkgdesc='The new beautiful, fluffy client for Mastodon'
arch=('x86_64')
url='https://hyperspace.marquiskurt.net'
license=('custom:NPL')
provides=('hyperspace')
conflicts=('hyperspace')
depends=('fuse')
options=(!strip)
_appimage="Hengi-${pkgver}.AppImage"
source=(
    "Hyperspace-${pkgver}.AppImage::https://github.com/hyperspacedev/hyperspace/releases/download/v${pkgver}/Hyperspace-${pkgver}.AppImage"
    "https://github.com/hyperspacedev/hyperspace/raw/v${pkgver}/LICENSE"
    "hyperspace.desktop"
    "hyperspace.png"
    )
noextract=("${_appimage}")
sha256sums=(
    'aeeae9d7a5a92f33f53aa045359a9e56da93682cdb68f8e512cc56aa325e45c8'
    '3dee0d29eba904aaaa8e9b4b66daba48cde5f9c42c872475f8a0ae94fe2bc2b8'
    'SKIP'
    'SKIP'
    )

package() {
    install -Dm755 $_appimage "$pkgdir"/usr/bin/hyperspace
    chmod +x "${pkgdir}/usr/bin/hyperspace"

    install -Dm644 "hyperspace.desktop"                    "${pkgdir}/usr/share/applications/hyperspace.desktop"
    install -Dm644 "hyperspace.png"                        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/hyperspace.png" 
    install -Dm644 LICENSE                                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
