# Maintainer: Antti <antti@antti.codes>

pkgname=bluemap-bin
pkgver=5.4
pkgrel=2
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
            'eae2142a6669a4abb69a8a7e9c4c343b5747ddf8258d8fe7e329ea0c063ed8b1d89116b82256e605ff97e6fb0f27ff12405af6a47927867ee71e6e4cd1bcabd8')

package() {
  install -Dm644 "${srcdir}/BlueMap-${pkgver}-cli.jar" "${pkgdir}/opt/bluemap/bluemap-cli.jar"
  install -Dm755 "${srcdir}/bluemap" "${pkgdir}/usr/bin/bluemap"
}
