# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>
# Contributor: Tom Hetmer <tom.hetmer / outlook.cz>
# Contributor: Daniel Milde <daniel / milde.cz>

pkgname=winbox64
pkgver=3.22
pkgrel=1
pkgdesc="Mikrotik RouterOS GUI Configurator. 64-bit version for wine64"
url="http://www.mikrotik.com"
arch=('x86_64')
license=('custom')
depends=('wine-x64')
makedepends=('xdg-utils')
optdepends=(
  'ttf-ms-fonts: for better fonts'
)
install=${pkgname}.install
source=("${pkgname}-${pkgver}.exe::http://download.mikrotik.com/winbox/${pkgver}/${pkgname}.exe"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}")
sha256sums=('496f7610fc1a193b7c944c1dbc8ec8e9988d9e8456528e402ccca08f43d0c791'
            '3623e2531e18d3b17ce0122c88836f5d892c24e567c8844bf6b90e87167c5d13'
            '603eaed8dfb5b6146712c5cee801e6d77f1f45d6bd5c4b545f9f84193834d380'
            '3c0ef0561dff45975c00fc88bdb434038033def00564e376757367f53a7882b8')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.exe" "${pkgdir}/opt/${pkgname}/${pkgname}.exe"
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm655 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm655 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
