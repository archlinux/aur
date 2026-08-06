# Maintainer: Antti <antti@antti.codes>

pkgname=bluemap-bin
pkgver=5.23
pkgrel=1
pkgdesc="A Minecraft mapping tool that creates 3D models of your Minecraft worlds and displays them in a web viewer."
arch=('any')
url="https://bluemap.bluecolored.de/"
license=('MIT')
depends=('java-runtime>=25')

source=(
  "bluemap"
  "https://github.com/BlueMap-Minecraft/BlueMap/releases/download/v${pkgver}/BlueMap-${pkgver}-cli.jar"
)

sha512sums=('5297b4d09ea053958f19c89bf7f298386ee810d8fb242e4a7379b0e29a9c960eaeea76b474198b537f81dc2a6c9bd0ad462adcef0468ee40aabf5b084ec124ff'
            'b24508ceb9e067c05333023467556e7ab018371a2139c134ea0c2ed75771cf057f1e63cbace76ee8556fa32696425c250da996ce98df2abb5accbdecd6d493fa')

package() {
  install -Dm644 "${srcdir}/BlueMap-${pkgver}-cli.jar" "${pkgdir}/opt/bluemap/bluemap-cli.jar"
  install -Dm755 "${srcdir}/bluemap" "${pkgdir}/usr/bin/bluemap"
}
