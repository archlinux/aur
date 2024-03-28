# Maintainer: Harrison <htv04rules at gmail com>

pkgname=picotron
pkgver=0.1.0d
pkgrel=1
pkgdesc="A fantasy workstation for making pixelart games, animations, music, demos and other curiosities."
arch=("x86_64")
url="https://www.lexaloffle.com/picotron.php"
license=("custom:commercial")
depends=("sdl2")
optdepends=()
provides=("picotron")

source=("${pkgname}.desktop"
        "${pkgname}.xml")
source_x86_64=("file://${pkgname}_${pkgver}_amd64.zip")

sha256sums=("04862c5d2f4ec10f4979ec316c4e14b01e073806d90bc23290e8420e142f710a"
            "45525e5ff68d3380492e188e626cf2208491ba0df79cc246aa8560e05f5b3100")
sha256sums_x86_64=("5abc7d167867aab252e4cee64e30fcf0dc0b5af8ee5cd94b5250cba27f93654f")

package() {
  pushd "${srcdir}/picotron" > /dev/null
  
  # License
  install -Dm644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # Binary
  install -Dm755 "picotron_dyn" "${pkgdir}/usr/bin/${pkgname}"
  
  # Desktop entry
  install -Dm644 "lexaloffle-picotron.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"
  
  popd > /dev/null
}
