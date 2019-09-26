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
md5sums=('7903f091205471d15b54d23a27973d61'
         '60eaa447ed6bbb47a183b2118d7b3010'
         '2b7f48f1045810ce9892b337a00bb021'
         'ec0696cd2866f50b4469e9ea0613473f')
noextract=("${pkgname}-${pkgver}.jar")

package() {
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/server-release.jar"
  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
