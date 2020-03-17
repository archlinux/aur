# Maintainer: Arkadiusz Dzięgielewski <arek.dzski@gmail.com>

pkgname=teamspeak5
pkgver=5.0.0beta19
pkgrel=1
pkgdesc="The future of gaming communication"
url="http://www.teamspeak.com"
license=('custom')
optdepends=('libpulse')
arch=('x86_64')
source=('teamspeak5.desktop'
        'teamspeak5.svg'
        "https://files.teamspeak-services.com/teamspeak/teamspeak-client.tar.gz")
sha256sums=('1a94b6735bba053e3e0a3dc26459761d8e2b64cf95f84c987cbd9486d3c42f82'
            '61cb18d776be69cc0c260aa578fb874dc093e9e1b874b4358d87d504b98dedfc'
            'SKIP')

package() {
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/opt/${pkgname}"

  cp -r "${srcdir}/"* "${pkgdir}/opt/${pkgname}/"

  install -Dm644 "${srcdir}/teamspeak5.desktop" "${pkgdir}/usr/share/applications/teamspeak5.desktop"
  install -Dm644 "${srcdir}/teamspeak5.svg" "${pkgdir}/usr/share/pixmaps/teamspeak5.svg"

  ln -s /opt/${pkgname}/TeamSpeak/licenses/en/la.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -s /opt/${pkgname}/TeamSpeak "${pkgdir}/usr/bin/${pkgname}"
}
