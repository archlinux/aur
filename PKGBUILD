# Maintainer: klpod221 <klpod221@gmail.com>
pkgname=kerminal-bin
_pkgname=kerminal
pkgver=0.4.0
pkgrel=1
pkgdesc="Modern terminal app with SSH/SFTP support"
arch=('x86_64')
url="https://github.com/klpod221/kerminal"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${pkgname}.install"

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/klpod221/kerminal/releases/download/v${pkgver}/kerminal-${pkgver}.tar.gz"
  "kerminal.desktop"
  "kerminal.png"
  "kerminal-bin.install"
)

sha256sums=('ae9971ab1b8097d65b62a67843c8a77b60060af9a9597b75a2a631195c33ddf3'
            '2df1c604059ef87538597729413712e72248afc3ebbbbc9ba35656aae2fb28da'
            'eb1984cf3d4d3a78c013d65da067822f7ef9a6d32ea3a54fa22834d3981702fc'
            '6628d9ee715006d102c7b6fe8108ed6c755f71fa03e948b7f4d0842026645e97')

package() {
  install -d "${pkgdir}/usr/lib/${_pkgname}"
  cp -r "${srcdir}/kerminal-${pkgver}/"* "${pkgdir}/usr/lib/${_pkgname}/"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${srcdir}/kerminal.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/kerminal.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
}
