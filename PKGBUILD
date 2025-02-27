# Maintainer: Harrison <contact@htv04.com>

pkgname=picotron
pkgver=0.1.1e
pkgrel=2
pkgdesc="A fantasy workstation for making pixelart games, animations, music, demos and other curiosities."
arch=("x86_64")
url="https://www.lexaloffle.com/picotron.php"
license=("custom:commercial")
depends=("sdl2")
optdepends=()
provides=("${pkgname}")

source=("${pkgname}.desktop"
        "${pkgname}.sh"
        "${pkgname}.xml")
source_x86_64=("file://${pkgname}_${pkgver}_amd64.zip")

sha256sums=("04862c5d2f4ec10f4979ec316c4e14b01e073806d90bc23290e8420e142f710a"
            "ed9753f910a3484ebf8a5ce37ee324d51f020a3124150aebff8d0b413211221f"
            "45525e5ff68d3380492e188e626cf2208491ba0df79cc246aa8560e05f5b3100")
sha256sums_x86_64=("011f71accf6870ef33dbd1d5411cf3bc7b7ef4e675f766b6b45570f81c9a0e8f")

package() {
  pushd "${srcdir}/picotron" > /dev/null

  # License
  install -Dm644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Binaries
  install -Dm644 "picotron.dat" "${pkgdir}/usr/share/${pkgname}/picotron.dat"
  install -Dm755 "picotron_dyn" "${pkgdir}/usr/share/${pkgname}/picotron_dyn"
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Desktop entry
  install -Dm644 "lexaloffle-picotron.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"

  popd > /dev/null
}
