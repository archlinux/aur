# Maintainer: Ahmed <ahmedalwanmunshed@gmail.com>
pkgname=zerone-ai-bin
pkgver=1.0.0
pkgrel=7
pkgdesc="ZERONE AI Desktop Application - Intelligent Chat Interface"
arch=('x86_64')
url="https://github.com/b2-3c/zerone-ai-releases"
license=('ISC')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'fuse2')
options=(!strip)

source=("https://github.com/b2-3c/zerone-ai-releases/releases/download/v${pkgver}/ZERONE-AI-${pkgver}.AppImage"
        "zerone-ai.desktop"
        "zerone-ai.png")

sha256sums=('SKIP'
            'SKIP'
            'SKIP')

package() {
    install -Dm755 "${srcdir}/ZERONE-AI-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/zerone-ai"
    
    install -Dm644 "${srcdir}/zerone-ai.desktop" "${pkgdir}/usr/share/applications/zerone-ai.desktop"
    install -Dm644 "${srcdir}/zerone-ai.png" "${pkgdir}/usr/share/pixmaps/zerone-ai.png"
}
