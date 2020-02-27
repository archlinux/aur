# Maintainer: tercean <cg@zknt.org>
pkgname=hyperspace-appimage
pkgver=1.0.4
pkgrel=2
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
    "https://github.com/hyperspacedev/hyperspace/raw/v${pkgver}/LICENSE"
    "hyperspace.desktop"
    "hyperspace.png"
    )
noextract=("${_appimage}")
sha256sums=(
    'd0ae7aed73777ef781c2b9b33c99a1be2d4709a7e07e1f9e0066901f0fe0a9a2'
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
