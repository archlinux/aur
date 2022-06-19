# Maintainer: nycex <nycex / cccp.org>
# Contributor: Tom Hetmer <tom.hetmer / outlook.cz>
# Contributor: Daniel Milde <daniel / milde.cz>

_pkgname=winbox
pkgname=${_pkgname}-xdg
pkgver=3.36
pkgrel=1
pkgdesc="Mikrotik RouterOS GUI Configurator (wine). xdg base directory specification compliant version"
url="http://www.mikrotik.com"
arch=('x86_64')
license=('custom')
depends=('wine' 'ttf-tahoma')
conflicts=('winbox')
optdepends=(
  'ttf-ms-fonts: for better fonts'
)
install=${pkgname}.install
source=("${_pkgname}-${pkgver}.exe::https://download.mikrotik.com/winbox/${pkgver}/${_pkgname}64.exe"
        "${_pkgname}.desktop"
        "${_pkgname}.png"
        "${_pkgname}")
sha256sums=('3d16e27571f0541a0e04ffa7c3f182e8aa2a2b260016038b80e0c23f8b4e6d30'
            '6e9ffe5ff24d286d2d719455dd52f6ddf8c5ed2ba0494c566a67555df37d5c19'
            '603eaed8dfb5b6146712c5cee801e6d77f1f45d6bd5c4b545f9f84193834d380'
            '661fbcfbcbd0590278563707129de526a4cfb32c0837b4ba6315a17b66451891')

package() {
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.exe" "${pkgdir}/usr/share/${_pkgname}/${_pkgname}.exe"
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm655 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm655 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

