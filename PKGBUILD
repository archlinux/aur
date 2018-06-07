# Maintainer: Tom Hetmer <tom.hetmer / outlook.cz>
# Maintainer: Daniel Milde <daniel / milde.cz>

pkgname=winbox
pkgver=3.14
pkgrel=1
pkgdesc="Mikrotik RouterOS GUI Configurator (wine)"
url="http://www.mikrotik.com"
arch=('x86_64' 'i686')
license=('custom')
depends=('wine')
optdepends=(
  'ttf-ms-fonts: for better fonts'
)
install=${pkgname}.install
source=("${pkgname}-${pkgver}.exe::http://download2.mikrotik.com/routeros/winbox/${pkgver}/${pkgname}.exe"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}")
sha256sums=('62cb19913c1a2f1c1051e7b9651d4132263863ab648d2174e1993bdf63372521'
            '6e9ffe5ff24d286d2d719455dd52f6ddf8c5ed2ba0494c566a67555df37d5c19'
            '603eaed8dfb5b6146712c5cee801e6d77f1f45d6bd5c4b545f9f84193834d380'
            'e7d6a2ffc0eda07ac40db88d92629bf8b1e2fa9433f3b74b1eef3437c1d0f6c6')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.exe" "${pkgdir}/usr/share/${pkgname}/${pkgname}.exe"
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm655 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm655 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
