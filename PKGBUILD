# Maintainer: maniacata <maniaciachao at gmail dot com>
# Contributor: Martin Thierer <thierer@web.de>
# Contributor: Amy Wilson <awils_1[at]xsmail[dot]com>
# Contributor: Simon Doppler <dopsi[at]dopsi[dot]ch>
# Contributor: Agustin Borgna <hello[at]aborgna.com.ar>
# Contributor: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Renan Birck <renan.ee.ufsm at gmail.com>

pkgname=logisim-ita-bin
_name=logisim-ita
pkgver=2.16.1.0
pkgrel=1
pkgdesc='An educational tool for designing and simulating digital logic circuits (Italian fork)'
arch=('any')
url="https://github.com/LogisimIt/Logisim"
license=('GPL3')
depends=('java-runtime>=8' 'bash' 'hicolor-icon-theme')
source=("${_name}-${pkgver}.jar::https://github.com/LogisimIt/Logisim/releases/download/v${pkgver}/Logisim-ITA.jar"
    'logisim-ita.desktop'
    'logisim-ita.sh'
    'logisim-ita.xml')
sha256sums=('6b552a520fea30e646e64a8253df43e5a8e8c01ab2ffae271660b1035964dca1'
            'f17a8e951acaf3c8b81f43f7792f83cd4fb47ca604854a30ce165fb233026c54'
            'ed3efbd2535673ffbf72c2f39baab90e0bae0f89fc62f226eb5fa47fccf928b3'
            'e591a41656374fee3caa2730706bc86ef61076f6153e52a0e263b055031499eb')

package() {
    cd "$srcdir"

    install -Dm644 ${_name}-${pkgver}.jar "${pkgdir}/usr/share/java/${_name}/${_name}.jar"
    install -Dm644 ${_name}.xml "${pkgdir}/usr/share/mime/packages/${_name}.xml"
    install -Dm644 ${_name}.desktop "${pkgdir}/usr/share/applications/${_name}.desktop"

    for SIZE in 16 20 24 48 64 128; do
      install -Dm644 "resources/logisim/img/logisim-icon-${SIZE}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${SIZE}x${SIZE}/apps/${_name}.png"
    done

    install -Dm755 "${_name}.sh" "${pkgdir}/usr/bin/${_name}"
}
