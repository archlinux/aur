pkgname=ugs-platform-bin
pkgver=2.1.9
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
sha256sums=('b33d7941fb2b38a19b56b3ea8d13a897db10d5a0246dfb9265d60215e31570b9'
            'dc5db4c8ce2315723c1da8566fbbbbd470982563af543694371038e8bb0a7207'
            '3f1508941c2734365952d685ef4168471b047f1df226fd46120ba82ea701af08')


package() {
    mkdir -p "${pkgdir}/usr/share/java"
    cp -r "${srcdir}/ugsplatform" "${pkgdir}/usr/share/java/"
    chmod +x "${pkgdir}/usr/share/java/ugsplatform"

    install -Dm644 "${srcdir}/ugsplatform.svg" "${pkgdir}/usr/share/pixmaps/ugsplatform.svg"
    install -Dm644 "${srcdir}/ugsplatform.desktop" "${pkgdir}/usr/share/applications/ugsplatform.desktop"
}
