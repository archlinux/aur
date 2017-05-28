# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_locale='zh-CN'
pkgname=palemoon-i18n-zh-cn
pkgver=27.3.1
pkgrel=1
pkgdesc="Chinese (Simplified) language pack for Pale Moon browser"
arch=('any')
url="https://addons.palemoon.org/language-packs/"
license=('MPL' 'GPL')
source=("${pkgname}-${pkgver}.xpi"::"http://rm-eu.palemoon.org/langpacks/${pkgver/.*/}.x/${_locale}.xpi")
sha256sums=('f3855e0fe9f408db624ed5b3f34122db55f4ccd248e28ba697a7690a364e23be')
depends=('palemoon-i18n-common')
noextract=("${pkgname}-${pkgver}.xpi")

package() {
  install -m 755 -d "${pkgdir}/usr/lib/palemoon/browser/extensions"
  install -m 644 "${pkgname}-${pkgver}.xpi" \
    "${pkgdir}/usr/lib/palemoon/browser/extensions/langpack-${_locale}@palemoon.org.xpi"
}

