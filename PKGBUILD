# Maintainer: Pairadux

pkgname=lapse-appimage
pkgver=0.4.1
pkgrel=1
pkgdesc='A spaced repetition flashcard app built with Flutter'
arch=('x86_64')
url='https://github.com/Pairadux/lapse'
license=('GPL-3.0-or-later')
depends=('fuse2')
provides=('lapse')
conflicts=('lapse')
options=(!strip !debug)
source=("${pkgname}-${pkgver}.AppImage::https://github.com/Pairadux/lapse/releases/download/v${pkgver}/lapse-${pkgver}-linux-x86_64.AppImage"
        "lapse.desktop::https://raw.githubusercontent.com/Pairadux/lapse/v${pkgver}/.github/aur/lapse.desktop"
        "lapse.png::https://raw.githubusercontent.com/Pairadux/lapse/v${pkgver}/assets/icons/icon-other.png")
noextract=("${pkgname}-${pkgver}.AppImage")
sha256sums=('53f67a7d8de5ef2979d84e066284462e22a983b27fc8a2436e81498359fee9d4'
            'SKIP'
            'SKIP')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/lapse/lapse.AppImage"
    install -Dm644 "${srcdir}/lapse.desktop" "${pkgdir}/usr/share/applications/lapse.desktop"
    install -Dm644 "${srcdir}/lapse.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/lapse.png"

    install -d "${pkgdir}/usr/bin"
    ln -s /opt/lapse/lapse.AppImage "${pkgdir}/usr/bin/lapse"
}
