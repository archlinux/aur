# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
_pkgbase='firefox-i18n'
_language='ca-valencia'
pkgname=("${_pkgbase}-${_language}")
pkgver=59.0
pkgrel=2
pkgdesc="Valencian language pack for Firefox"
arch=('any')
url="http://www.softvalencia.org/guies/firefox-en-valencia/"
license=('GPL' 'LGPL' 'MPL')
provides=("${pkgname}")
depends=("firefox>=$pkgver")
source=("https://addons.mozilla.org/firefox/downloads/file/890458/valencian_catalan_language_pack_for_firefox-${pkgver}-fx.xpi")
sha256sums=('d82c712205a1a18ea986b130c3e60f7434a505dc6ad9e7c3ed3e500ce4741ecb')

# Don't extract xpi
noextract=('valencian_catalan_language_pack_for_firefox-${pkgver}-fx.xpi')

package() {
    cd "${srcdir}"
    install -Dm644 "valencian_catalan_language_pack_for_firefox-${pkgver}-fx.xpi" \
      "${pkgdir}/usr/lib/firefox/browser/extensions/langpack-${_language}@firefox.mozilla.org.xpi"
}

# vim: set ts=4 sw=2 et syn=sh ft=sh:
