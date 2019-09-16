# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_locale='tr'
pkgname=palemoon-i18n-tr
pkgver=28.7.0
pkgrel=1
pkgdesc="Turkish language pack for Pale Moon browser"
arch=('any')
url="https://addons.palemoon.org/language-packs/"
license=('MPL' 'GPL')
source=("${pkgname}-${pkgver}.xpi"::"https://addons.palemoon.org/?component=download&version=${pkgver}&id=langpack-${_locale}@palemoon.org")
sha256sums=('2360ff0a8b0c7d66055cc9b69826f21f7e06360a1e3c8c55f7abbebdf3dbbb5c')
depends=('palemoon-i18n-common')
noextract=("${pkgname}-${pkgver}.xpi")
DLAGENTS=("http::/usr/bin/curl --user-agent 'PaleMoon' --output %o %u"
          "${DLAGENTS[@]}")

package() {
  install -m 755 -d "${pkgdir}/usr/lib/palemoon/browser/extensions"
  install -m 644 "${pkgname}-${pkgver}.xpi" \
    "${pkgdir}/usr/lib/palemoon/browser/extensions/langpack-${_locale}@palemoon.org.xpi"
}

