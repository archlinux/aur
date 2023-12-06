# Maintainer: Antti <antti@antti.codes>

pkgname=bluemap-bin
pkgver=3.19
pkgrel=1
pkgdesc="A Minecraft mapping tool that creates 3D models of your Minecraft worlds and displays them in a web viewer."
arch=('any')
url="https://bluemap.bluecolored.de/"
license=('MIT')
depends=('java-runtime>=11')

source=(
  "bluemap"
  "https://github.com/BlueMap-Minecraft/BlueMap/releases/download/v${pkgver}/BlueMap-${pkgver}-cli.jar"
)

sha512sums=('00797a52766b1adc3cc8102009d18d1eaa82702aec6fccb45a9c44110e8dd66d058dbab46b3d3622ab77459338080e911fc575d69bcceee8d9ac2be97ff1b8eb'
            'a134110058c1ff25836d3f149877cd61a5aa5f3fee8c396b0e0cc5c9049426e01d9190aca8bccb98009811ba4f0f36d2f792b6e7fbeda604533822a0846b6bb5')

package() {
  install -Dm644 "${srcdir}/BlueMap-${pkgver}-cli.jar" "${pkgdir}/opt/bluemap/bluemap-cli.jar"
  install -Dm755 "${srcdir}/bluemap" "${pkgdir}/usr/bin/bluemap"
}
