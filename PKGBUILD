# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_locale='da'
pkgname=palemoon-i18n-da
pkgver=33.8.0
pkgrel=1
pkgdesc="Danish language pack for Pale Moon browser"
arch=('any')
url="https://addons.palemoon.org/language-packs/"
license=('MPL-2.0')
source=("${pkgname}-${pkgver}.xpi"::"https://addons.palemoon.org/?component=download&version=${pkgver}&id=langpack-${_locale}@palemoon.org")
sha256sums=('a244f0f522b688cddd56b0db3a99947512962b05192b03480bab930e4cf170d2')
depends=('palemoon-i18n-common')
noextract=("${pkgname}-${pkgver}.xpi")
DLAGENTS=("https::/usr/bin/curl --user-agent 'Mozilla%20Linux%20PaleMoon/${pkgver}' --output %o %u"
          "${DLAGENTS[@]}")

package() {
  install -m 755 -d "${pkgdir}/usr/lib/palemoon/browser/extensions"
  install -m 644 "${pkgname}-${pkgver}.xpi" \
    "${pkgdir}/usr/lib/palemoon/browser/extensions/langpack-${_locale}@palemoon.org.xpi"
}

