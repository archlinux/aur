# Maintainer: Antti <antti@antti.codes>

pkgname=bluemap-bin
pkgver=5.7
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

sha512sums=('00797a52766b1adc3cc8102009d18d1eaa82702aec6fccb45a9c44110e8dd66d058dbab46b3d3622ab77459338080e911fc575d69bcceee8d9ac2be97ff1b8eb'
            '209175a0753c2a99d72a78a59d1937b5056610a830ce631390db7125a0a3dbfa1ce719a033213ccd507e6f010fbd6fc81bedb1a595d34577c547fb596f627d8c')

package() {
  install -Dm644 "${srcdir}/BlueMap-${pkgver}-cli.jar" "${pkgdir}/opt/bluemap/bluemap-cli.jar"
  install -Dm755 "${srcdir}/bluemap" "${pkgdir}/usr/bin/bluemap"
}
