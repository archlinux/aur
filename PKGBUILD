pkgname=universal-gcode-sender-bin
pkgver=2.1.26
pkgrel=1
pkgdesc='Universal G-Code Sender (UGS) is a Java based, cross platform G-Code sender, compatible with GRBL, TinyG, g2core and Smoothieware.'
arch=('any')
url='https://universalgcodesender.com/'
license=('GPL-3.0-or-later')
depends=('java-runtime')
conflicts=('ugs-platform-bin')
provides=('ugs-platform-bin')
replaces=('ugs-platform-bin')
source=(
    "https://github.com/winder/Universal-G-Code-Sender/releases/download/v${pkgver}/ugs-platform-app-${pkgver}.zip"
    "ugsplatform.svg::https://raw.githubusercontent.com/winder/Universal-G-Code-Sender/v${pkgver}/ugs-platform/application/src/main/app-resources/icon.svg"
    'ugsplatform.desktop'
)
sha256sums=('c25132114eff2a68295c86968e04276ca29d82a63c13b1f82e237169a38e9c6d'
            'dc5db4c8ce2315723c1da8566fbbbbd470982563af543694371038e8bb0a7207'
            '3f1508941c2734365952d685ef4168471b047f1df226fd46120ba82ea701af08')


package() {
    mkdir -p "${pkgdir}/usr/share/java"
    cp -r "${srcdir}/ugsplatform" "${pkgdir}/usr/share/java/"
    chmod +x "${pkgdir}/usr/share/java/ugsplatform"

    install -Dm644 "${srcdir}/ugsplatform.svg" "${pkgdir}/usr/share/pixmaps/ugsplatform.svg"
    install -Dm644 "${srcdir}/ugsplatform.desktop" "${pkgdir}/usr/share/applications/ugsplatform.desktop"
}
