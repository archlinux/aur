# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=teamspeak5
pkgver=5.0.0beta24
pkgrel=2
pkgdesc="The future of gaming communication"
url="http://www.teamspeak.com"
license=('custom')
optdepends=('libpulse')
arch=('x86_64')
source=('teamspeak5.desktop'
        'teamspeak5.svg'
        "https://files.teamspeak-services.com/teamspeak/teamspeak-client.tar.gz")
sha256sums=('0b6dd662064aaea8ecf4991b9f460faff2f5531f10bf6c6c40ce6f18474242a7'
            '61cb18d776be69cc0c260aa578fb874dc093e9e1b874b4358d87d504b98dedfc'
            'SKIP')
conflicts=('teamspeak') # Incorrectly named and structured

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
