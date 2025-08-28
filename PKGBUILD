# Maintainer: klpod221 <klpod221@gmail.com>
pkgname=kerminal-bin
_pkgname=kerminal
pkgver=0.2.2
pkgrel=1
pkgdesc="Modern terminal app with SSH/SFTP support"
arch=('x86_64')
url="https://github.com/klpod221/kerminal"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=(
  "${_pkgname}-${pkgver}.AppImage::https://github.com/klpod221/kerminal/releases/download/v${pkgver}/kerminal-${pkgver}.AppImage"
  "kerminal.desktop"
  "kerminal.png"
)

sha256sums_x86_64=('2b094fb7c89798c3311e2529eac7f4cb453eacd4a648e52032e86616bf588ee7'
                   '2df1c604059ef87538597729413712e72248afc3ebbbbc9ba35656aae2fb28da'
                   'eb1984cf3d4d3a78c013d65da067822f7ef9a6d32ea3a54fa22834d3981702fc')

package() {
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/kerminal.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/kerminal.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
}
