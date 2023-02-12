# Maintainer: Malte Jürgens <maltejur@dismail.de>
# Contributor: egecelikci <egecelikci@gmail.com>

pkgname=runebook-bin
_pkgname=runebook
__pkgname=RuneBook
pkgver=1.16.3
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
sha256sums=("cae9e459a13615f7318677a630a2a0b0d87fa68854c5e373b52d2f6c5367c828" "SKIP" "SKIP")

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
