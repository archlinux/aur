# Maintainer: Antti <antti@antti.codes>

pkgname=bluemap-bin
pkgver=5.3
pkgrel=1
pkgdesc="A Minecraft mapping tool that creates 3D models of your Minecraft worlds and displays them in a web viewer."
arch=('any')
url="https://bluemap.bluecolored.de/"
license=('MIT')
depends=('java-runtime>=16')

source=(
  "bluemap"
  "https://github.com/BlueMap-Minecraft/BlueMap/releases/download/v${pkgver}/BlueMap-${pkgver}-cli.jar"
)

sha512sums=('00797a52766b1adc3cc8102009d18d1eaa82702aec6fccb45a9c44110e8dd66d058dbab46b3d3622ab77459338080e911fc575d69bcceee8d9ac2be97ff1b8eb'
            '2dd5b088a52a3b0d0e553284bf395d4e334f2292a62ac0c177ac45ff514fe2388535e3bc51ad81bf3b6a6da225c20eda126c733ca67f4ecbfe269b339b29b856')

package() {
  install -Dm644 "${srcdir}/BlueMap-${pkgver}-cli.jar" "${pkgdir}/opt/bluemap/bluemap-cli.jar"
  install -Dm755 "${srcdir}/bluemap" "${pkgdir}/usr/bin/bluemap"
}
