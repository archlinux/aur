# Maintainer: Dmytro Meleshko <dmytro.meleshko@gmail.com>
_pkgname=mindustry
pkgname=${_pkgname}-bin
pkgver=96
pkgrel=1
pkgdesc="A sandbox tower defense game written in Java"
arch=("any")
url="https://github.com/Anuken/Mindustry"
license=("GPL3")
depends=("java-runtime=8")
# provides=(${_pkgname})
replaces=(${_pkgname})
conflicts=(${_pkgname})
source=("${pkgname}-${pkgver}.jar::https://github.com/Anuken/Mindustry/releases/download/v${pkgver}/Mindustry.jar"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}.sh")
sha256sums=('30d1f984c6924af1d22f7317819a42042393488ca53e7ceed509bab74f70304d'
            '7fafd7598480293530e2d5c62abdbb7d37f40ed4d5fbae0bdeaae8d1167b5679'
            'b4ca7e8083ab1d5e63601a63378211c9def97333324e6c9b48acf4cfb83fa9e8'
            '938f5f9f636379402ba0bb9a53345de499f4f3fd50f232b31605129dcf4ea6c9')
noextract=("${pkgname}-${pkgver}.jar")

package() {
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm755 "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${_pkgname}/Mindustry.jar"
}
