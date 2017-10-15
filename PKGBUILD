# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_locale='de'
pkgname=palemoon-i18n-de
pkgver=27.5.0
pkgrel=1
pkgdesc="German language pack for Pale Moon browser"
arch=('any')
url="https://addons.palemoon.org/language-packs/"
license=('MPL' 'GPL')
source=("${pkgname}-${pkgver}.xpi"::"http://rm-eu.palemoon.org/langpacks/${pkgver/.*/}.x/${_locale}.xpi")
sha256sums=('303ab7bdfa703f2b96f2b93ecf63fd2aa0bb61af3dbe52dc1bbcde02066ed84a')
depends=('palemoon-i18n-common')
noextract=("${pkgname}-${pkgver}.xpi")

package() {
  install -m 755 -d "${pkgdir}/usr/lib/palemoon/browser/extensions"
  install -m 644 "${pkgname}-${pkgver}.xpi" \
    "${pkgdir}/usr/lib/palemoon/browser/extensions/langpack-${_locale}@palemoon.org.xpi"
}

