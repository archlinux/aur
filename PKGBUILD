# Maintainer: Dmytro Meleshko <dmytro.meleshko@gmail.com>
pkgname=mindustry-server
pkgver=96
pkgrel=1
pkgdesc="Server of a sandbox tower defense game written in Java"
arch=("any")
url="https://github.com/Anuken/Mindustry"
license=("GPL3")
depends=("java-runtime=8")
source=("${pkgname}-${pkgver}.jar::https://github.com/Anuken/Mindustry/releases/download/v${pkgver}/server-release.jar"
        "${pkgname}.sh"
        "${pkgname}.png"
        "${pkgname}.desktop")
sha256sums=('a861e31217cc32e289739c99dec025b64c907a4cb182e1b4f0826499a6a911c4'
            '679727847ba70773cee4f902114345e095b27f425aa00c4d3860d247705ed1f0'
            'b4ca7e8083ab1d5e63601a63378211c9def97333324e6c9b48acf4cfb83fa9e8'
            'cb149233b1a91e4dd951103568beea31078b96dc8615609cffd7eadbbccc6672')
noextract=("${pkgname}-${pkgver}.jar")

package() {
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/server-release.jar"
  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
