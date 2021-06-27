# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_locale='ko'
pkgname=palemoon-i18n-ko
pkgver=29.2.0
pkgrel=1
pkgdesc="Korean language pack for Pale Moon browser"
arch=('any')
url="https://addons.palemoon.org/language-packs/"
license=('MPL' 'GPL')
source=("${pkgname}-${pkgver}.xpi"::"https://addons.palemoon.org/?component=download&version=${pkgver}&id=langpack-${_locale}@palemoon.org")
sha256sums=('867c2fa875d68eb3c93cc0906eae7da7a6e4d0cc9f05b070b26276bdd608e4c0')
depends=('palemoon-i18n-common')
noextract=("${pkgname}-${pkgver}.xpi")
DLAGENTS=("https::/usr/bin/curl --user-agent 'PaleMoon' --output %o %u"
          "${DLAGENTS[@]}")

package() {
  install -m 755 -d "${pkgdir}/usr/lib/palemoon/browser/extensions"
  install -m 644 "${pkgname}-${pkgver}.xpi" \
    "${pkgdir}/usr/lib/palemoon/browser/extensions/langpack-${_locale}@palemoon.org.xpi"
}

