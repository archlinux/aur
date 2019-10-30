# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>
# Contributor: Tom Hetmer <tom.hetmer / outlook.cz>
# Contributor: Daniel Milde <daniel / milde.cz>

pkgname=winbox64
pkgver=3.20
pkgrel=1
pkgdesc="Mikrotik RouterOS GUI Configurator. 64-bit version for wine64"
url="http://www.mikrotik.com"
arch=('x86_64')
license=('custom')
depends=('wine-x64')
optdepends=(
  'ttf-ms-fonts: for better fonts'
)
install=${pkgname}.install
source=("${pkgname}-${pkgver}.exe::http://download.mikrotik.com/winbox/${pkgver}/${pkgname}.exe"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}")
sha256sums=('20d270bc8d71d9a56bee3548f455a16cb8853898149f85e9157bbe05c81ef37c'
            '3623e2531e18d3b17ce0122c88836f5d892c24e567c8844bf6b90e87167c5d13'
            '603eaed8dfb5b6146712c5cee801e6d77f1f45d6bd5c4b545f9f84193834d380'
            '935a5434c1eb82798028046e2386c36da9224910c0e843164e86ba79c8cfd88c')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.exe" "${pkgdir}/opt/${pkgname}/${pkgname}.exe"
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm655 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm655 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
