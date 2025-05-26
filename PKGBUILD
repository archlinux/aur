# Maintainer: Tom Hetmer <tom.hetmer / outlook.cz>
# Maintainer: Daniel Milde <daniel / milde.cz>

_pkgbase=winbox
pkgname=${_pkgbase}3
pkgver=3.42
pkgrel=1
pkgdesc='Mikrotik RouterOS GUI Configurator (3.x with wine)'
url='https://mikrotik.com/download'
arch=('x86_64')
license=('custom')
depends=('wine')
optdepends=(
  'ttf-ms-fonts: for better fonts'
)
source=("${_pkgbase}-${pkgver}.exe::https://download.mikrotik.com/routeros/winbox/${pkgver}/${_pkgbase}64.exe"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}")
sha256sums=('47e83dfd0f9680d2e9623fee92c0acc4db40ea4272edeb53164304620305a24f'
            'ac5efd37f7fcdd11680b96e9716d098576c490fc0134b1ff366d07caef5adbad'
            '603eaed8dfb5b6146712c5cee801e6d77f1f45d6bd5c4b545f9f84193834d380'
            'ed63820aafb59d9b8eab860030d96e468e667849b9bde79fdd7bbf871cb71d3a')

package() {
  install -Dm755 "${srcdir}/${_pkgbase}-${pkgver}.exe" "${pkgdir}/usr/share/${pkgname}/${_pkgbase}.exe"
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm655 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm655 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
