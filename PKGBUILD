# Maintainer: klpod221 <klpod221@gmail.com>
pkgname=kerminal
pkgver=1.0.3
pkgrel=1
pkgdesc="Modern Terminal with SSH, Tunneling & Cross-Device Sync"
arch=('x86_64')
url="https://github.com/klpod221/kerminal"
license=('MIT')
install="${pkgname}.install"

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/klpod221/kerminal/releases/download/v${pkgver}/kerminal-${pkgver}.tar.gz"
  "kerminal.desktop"
  "kerminal.png"
  "kerminal.install"
)

sha256sums=('6fd1a6f95c79bdff588a952773e8a92e6378adec7fe51803aeb4323aa6f09e51'
            '2df1c604059ef87538597729413712e72248afc3ebbbbc9ba35656aae2fb28da'
            'eb1984cf3d4d3a78c013d65da067822f7ef9a6d32ea3a54fa22834d3981702fc'
            '6628d9ee715006d102c7b6fe8108ed6c755f71fa03e948b7f4d0842026645e97')

package() {
  install -d "${pkgdir}/usr/lib/${pkgname}"
  cp -r "${srcdir}/kerminal-${pkgver}/"* "${pkgdir}/usr/lib/${pkgname}/"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/Kerminal" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${srcdir}/kerminal.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/kerminal.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
}
