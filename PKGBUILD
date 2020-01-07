# Maintainer: Tom Hetmer <tom.hetmer / outlook.cz>
# Maintainer: Daniel Milde <daniel / milde.cz>

pkgname=winbox
pkgver=3.20
pkgrel=1
pkgdesc="Mikrotik RouterOS GUI Configurator (wine)"
url="http://www.mikrotik.com"
arch=('x86_64')
license=('custom')
depends=('wine')
optdepends=(
  'ttf-ms-fonts: for better fonts'
)
install=${pkgname}.install
source=("${pkgname}-${pkgver}.exe::https://download.mikrotik.com/winbox/${pkgver}/${pkgname}64.exe"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}")
sha256sums=('20d270bc8d71d9a56bee3548f455a16cb8853898149f85e9157bbe05c81ef37c'
            '6e9ffe5ff24d286d2d719455dd52f6ddf8c5ed2ba0494c566a67555df37d5c19'
            '603eaed8dfb5b6146712c5cee801e6d77f1f45d6bd5c4b545f9f84193834d380'
            'e7d6a2ffc0eda07ac40db88d92629bf8b1e2fa9433f3b74b1eef3437c1d0f6c6')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.exe" "${pkgdir}/usr/share/${pkgname}/${pkgname}.exe"
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm655 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm655 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
