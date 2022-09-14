# Maintainer: Malte Jürgens <maltejur@dismail.de>
# Contributor: egecelikci <egecelikci@gmail.com>

pkgname=runebook-bin
_pkgname=runebook
__pkgname=RuneBook
pkgver=1.16.1
pkgrel=1
pkgdesc="Arcane Rune Pages manager for League of Legends"
arch=('x86_64')
url="https://github.com/Soundofdarkness/RuneBook"
license=('MIT')
source=(
  "https://github.com/Soundofdarkness/${__pkgname}/releases/download/v${pkgver}/${__pkgname}_${pkgver}.tar.xz"
  "runebook-logo.png::https://raw.githubusercontent.com/Soundofdarkness/Runebook/master/img/logo.png"
  "runebook.desktop"
)
sha256sums=("28d04350e0d807ad153f730df1333d4424a7f30b9b2de54f5df5d860f4fc0f5d" "SKIP" "SKIP")

package() {
  cd "${pkgdir}"

  install -dm755 "usr/bin"
  install -dm755 "opt/${__pkgname}"
  install -dm755 "usr/share/icons/hicolor/256x256/apps"
  install -dm755 "usr/share/applications"

  cp -a "${srcdir}/${__pkgname}_${pkgver}/"* "${pkgdir}/opt/${__pkgname}"
  ln -s "/opt/${__pkgname}/${_pkgname}" "${pkgdir}/usr/bin"
  cp "${srcdir}/runebook-logo.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/runebook.png"
  cp "${srcdir}/runebook.desktop" "${pkgdir}/usr/share/applications/"
}
