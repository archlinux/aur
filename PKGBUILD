# Maintainer: Tom Hetmer <tom.hetmer / outlook.cz>
# Maintainer: Daniel Milde <daniel / milde.cz>

_pkgbase=winbox
pkgname=${_pkgbase}3
pkgver=3.41
pkgrel=1
pkgdesc="Mikrotik RouterOS GUI Configurator (3.x with wine)"
url="https://mikrotik.com/download"
arch=('x86_64')
license=('custom')
depends=('desktop-file-utils' 'wine' 'xdg-utils')
optdepends=(
  'ttf-ms-fonts: for better fonts'
)
install=${pkgname}.install
source=("${_pkgbase}-${pkgver}.exe::https://download.mikrotik.com/routeros/winbox/${pkgver}/${_pkgbase}64.exe"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}")
sha256sums=('8bc3ecf1f35952600ecb1a380c38c88e9d63c081a32204fd094d588230070bf6'
            '4b316a0521432da0596bb7cd1fdd1376a343f8c414b4f46d72a4a58878626bba'
            '603eaed8dfb5b6146712c5cee801e6d77f1f45d6bd5c4b545f9f84193834d380'
            'ed63820aafb59d9b8eab860030d96e468e667849b9bde79fdd7bbf871cb71d3a')

package() {
  install -Dm755 "${srcdir}/${_pkgbase}-${pkgver}.exe" "${pkgdir}/usr/share/${pkgname}/${_pkgbase}.exe"
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm655 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm655 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
