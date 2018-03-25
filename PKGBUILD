# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
_pkgbase='firefox-i18n'
_language='ca-valencia'
pkgname=("${_pkgbase}-${_language}")
pkgver=59.0
pkgrel=1
pkgdesc="Valencian language pack for Firefox"
arch=('any')
url="http://www.softvalencia.org/guies/firefox-en-valencia/"
license=('GPL' 'LGPL' 'MPL')
provides=("${pkgname}")
depends=("firefox>=$pkgver")
source=("https://addons.mozilla.org/firefox/downloads/file/780712/valencian_catalan_language_pack_for_firefox-${pkgver}-fx.xpi")
sha256sums=('5e13d55424d75384b20cce04165c0b1223ff49b5740b7a86bedb6d50ceefbe77')

# Don't extract xpi
noextract=('valencian_catalan_language_pack_for_firefox-${pkgver}-fx.xpi')

package() {
    cd "${srcdir}"
    install -Dm644 "valencian_catalan_language_pack_for_firefox-${pkgver}-fx.xpi" \
      "${pkgdir}/usr/lib/firefox/browser/extensions/langpack-${_language}@firefox.mozilla.org.xpi"
}

# vim: set ts=4 sw=2 et syn=sh ft=sh:
