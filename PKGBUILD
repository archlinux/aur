# Maintainer: Antti <antti@antti.codes>

pkgname=bluemap-bin
pkgver=5.15
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
            'e5d1419fd51a9dce625359736a66bc8adcd9bcc4838b5c526e3178a5eb4f942804ffb951a22cdd19e9b6173fe147d6542491483e63323c666edebfcb58ee3600')

package() {
  install -Dm644 "${srcdir}/BlueMap-${pkgver}-cli.jar" "${pkgdir}/opt/bluemap/bluemap-cli.jar"
  install -Dm755 "${srcdir}/bluemap" "${pkgdir}/usr/bin/bluemap"
}
