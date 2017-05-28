# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_locale='pl'
pkgname=palemoon-i18n-pl
pkgver=27.3.1
pkgrel=1
pkgdesc="Polish language pack for Pale Moon browser"
arch=('any')
url="https://addons.palemoon.org/language-packs/"
license=('MPL' 'GPL')
source=("${pkgname}-${pkgver}.xpi"::"http://rm-eu.palemoon.org/langpacks/${pkgver/.*/}.x/${_locale}.xpi")
sha256sums=('4156db6c8699c7d391aa70b472df4f76d54b5fb49312cf410376e2bf8155474d')
depends=('palemoon-i18n-common')
noextract=("${pkgname}-${pkgver}.xpi")

package() {
  install -m 755 -d "${pkgdir}/usr/lib/palemoon/browser/extensions"
  install -m 644 "${pkgname}-${pkgver}.xpi" \
    "${pkgdir}/usr/lib/palemoon/browser/extensions/langpack-${_locale}@palemoon.org.xpi"
}

