pkgname=ugs-platform-bin
pkgver=2.1.2
pkgrel=1
pkgdesc='Universal G-Code Sender is a Java based, cross platform G-Code sender, compatible with GRBL, TinyG, g2core and Smoothieware.'
arch=('any')
url='https://universalgcodesender.com/'
license=('GPL-3.0-or-later')
depends=('java-runtime')
source=(
    "https://github.com/winder/Universal-G-Code-Sender/releases/download/v${pkgver}/ugs-platform-app-${pkgver}.zip"
    "ugsplatform.svg::https://raw.githubusercontent.com/winder/Universal-G-Code-Sender/v${pkgver}/ugs-platform/application/src/main/app-resources/icon.svg"
    'ugsplatform.desktop'
)
sha256sums=(
    'c3726b7f41d15d9bf19032fcc020ab28ca9e800d87f41efdd8dd431706aa0d4e'
    'dc5db4c8ce2315723c1da8566fbbbbd470982563af543694371038e8bb0a7207'
    'SKIP'
)

package() {
    mkdir -p "${pkgdir}/usr/share/java"
    cp -r "${srcdir}/ugsplatform" "${pkgdir}/usr/share/java/"
    chmod +x "${pkgdir}/usr/share/java/ugsplatform"

    install -Dm644 "${srcdir}/ugsplatform.svg" "${pkgdir}/usr/share/pixmaps/ugsplatform.svg"
    install -Dm644 "${srcdir}/ugsplatform.desktop" "${pkgdir}/usr/share/applications/ugsplatform.desktop"
}
