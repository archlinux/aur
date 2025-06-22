# Maintainer: Antti <antti@antti.codes>

pkgname=bluemap-bin
pkgver=5.8
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
            '6d95ac8174d3e5f38af24fd5d0a7da1f0b4082d5c34f71bf8c8024c9dffa5ef6847cb0ef5c3abcfc9ec48837ae8b546f6ca542452be84723724052a22734eb92')

package() {
  install -Dm644 "${srcdir}/BlueMap-${pkgver}-cli.jar" "${pkgdir}/opt/bluemap/bluemap-cli.jar"
  install -Dm755 "${srcdir}/bluemap" "${pkgdir}/usr/bin/bluemap"
}
