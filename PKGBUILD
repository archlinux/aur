# Maintainer: klpod221 <klpod221@gmail.com>
pkgname=kerminal-bin
_pkgname=kerminal
pkgver=0.2.9
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

sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
  install -d "${pkgdir}/usr/lib/${_pkgname}"
  cp -r "${srcdir}/linux-unpacked/"* "${pkgdir}/usr/lib/${_pkgname}/"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${srcdir}/kerminal.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/kerminal.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
}