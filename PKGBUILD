# Maintainer: Antti <antti@antti.codes>

pkgname=bluemap-bin
pkgver=5.16
pkgrel=1
pkgdesc="A Minecraft mapping tool that creates 3D models of your Minecraft worlds and displays them in a web viewer."
arch=('any')
url="https://bluemap.bluecolored.de/"
license=('MIT')
depends=('java-runtime>=21')

source=(
  "bluemap"
  "https://github.com/BlueMap-Minecraft/BlueMap/releases/download/v${pkgver}/BlueMap-${pkgver}-cli.jar"
)

sha512sums=('5297b4d09ea053958f19c89bf7f298386ee810d8fb242e4a7379b0e29a9c960eaeea76b474198b537f81dc2a6c9bd0ad462adcef0468ee40aabf5b084ec124ff'
            '6cd0cec64ce3b799e6a772280228e35e6a3bd3a4539c2075b9d7513008fb0647182d384c8e0ef7d1ece92367b6ac22f788b9900158da625dcc52a774eb10380e')

package() {
  install -Dm644 "${srcdir}/BlueMap-${pkgver}-cli.jar" "${pkgdir}/opt/bluemap/bluemap-cli.jar"
  install -Dm755 "${srcdir}/bluemap" "${pkgdir}/usr/bin/bluemap"
}
