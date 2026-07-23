# Maintainer: Kaique Lopes Bazilio

pkgname=2d-mmo-launcher-bin
_pkgname=2d-mmo-launcher
pkgver=0.1.0
pkgrel=1

pkgdesc="Launcher extensível para instalar e executar MMORPGs 2D no Linux"
arch=("x86_64")
url="https://github.com/nkaique21/2D-MMO-Launcher"
license=("MIT")

depends=(
  "gtk3"
  "webkit2gtk-4.1"
  "hicolor-icon-theme"
)

provides=("2d-mmo-launcher")
conflicts=("2d-mmo-launcher")

options=("!strip")

source=(
  "${_pkgname}-${pkgver}::https://github.com/nkaique21/2D-MMO-Launcher/releases/download/v${pkgver}/two-d-mmo-launcher"
  "2d-mmo-launcher.desktop"
  "2d-mmo-launcher.png"
  "LICENSE"
)

sha256sums=('641bb8bbadc2199f8ad6a7dbccddcf7b256b70f7de11ee0291b59b747ef7aeea'
            '7b40626bc6356798b7d2a5db8553511c7a1f36a25dca424a1bb5b0aa761b5ede'
            '867049a7388ad6aef9dd8beb4e8634c67997d5da45607cfe9200e94dbefb2320'
            '64e587754d31b70490c7db78c3e934b3ad12b3829241741a139414c9c3f54705')

package() {
  install -Dm755 \
    "${srcdir}/${_pkgname}-${pkgver}" \
    "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 \
    "${srcdir}/2d-mmo-launcher.desktop" \
    "${pkgdir}/usr/share/applications/2d-mmo-launcher.desktop"

  install -Dm644 \
    "${srcdir}/2d-mmo-launcher.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/2d-mmo-launcher.png"

  install -Dm644 \
    "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
