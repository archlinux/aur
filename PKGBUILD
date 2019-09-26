# Maintainer: Dmytro Meleshko <dmytro.meleshko@gmail.com>
pkgname=mindustry
pkgver=96
pkgrel=1
pkgdesc="A sandbox tower defense game written in Java"
arch=("any")
url="https://github.com/Anuken/Mindustry"
license=("GPL3")
depends=("java-runtime=8")
source=("${pkgname}-${pkgver}.jar::https://github.com/Anuken/Mindustry/releases/download/v${pkgver}/Mindustry.jar"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}.sh")
md5sums=('5a6a05233e2b564270d66a2a7f7c459c'
         'd9d626806de35d348eb8739ac317acfb'
         '2b7f48f1045810ce9892b337a00bb021'
         '76db8cba637b9345928a1327f5eb48af')
noextract=("${pkgname}-${pkgver}.jar")

package() {
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm755 "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/Mindustry.jar"
}
