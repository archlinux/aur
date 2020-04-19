# Maintainer: maniacata <maniaciachao at gmail dot com>
# Contributor: Martin Thierer <thierer@web.de>
# Contributor: Amy Wilson <awils_1[at]xsmail[dot]com>
# Contributor: Simon Doppler <dopsi[at]dopsi[dot]ch>
# Contributor: Agustin Borgna <hello[at]aborgna.com.ar>
# Contributor: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Renan Birck <renan.ee.ufsm at gmail.com>

pkgname=logisim-evolution
pkgver=3.3.4
pkgrel=2
pkgdesc='An educational tool for designing and simulating digital logic circuits'
arch=('any')
url="https://github.com/reds-heig/logisim-evolution"
license=('GPL3')
depends=('java-runtime>=10' 'bash' 'hicolor-icon-theme')

source=("${pkgname}-${pkgver}.jar::https://github.com/reds-heig/logisim-evolution/releases/download/v${pkgver}/logisim-evolution-${pkgver}-all.jar"
    "${pkgname}.desktop"
    "${pkgname}.sh"
    "${pkgname}.xml")
sha256sums=('b04e666ed0b74126dfc8c2ce6ae0d425ad5bb39c2d77ef214158b6dfc67f8b0d'
            '086851b07012f669743080dc4f059cf7727b19200384070852b34e142533385b'
            'd5975cc0025905ab8a8a451ce4362ba876bed88008d3a5b2c0a7f664a85da1ba'
            'f90c3709748af806a33c14e81c8bf91dc06c3a4f58fe00cfe14a8f1842e09dec')

package() {
    cd "$srcdir"

    install -Dm644 ${pkgname}-${pkgver}.jar "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm644 ${pkgname}.xml "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"
    install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    for SIZE in 16 20 24 48 64 128; do
      install -Dm644 "resources/logisim/img/logisim-icon-${SIZE}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${SIZE}x${SIZE}/apps/${pkgname}.png"
    done
    install -Dm644 "resources/logisim/img/logisim-icon.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

    install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}

