# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
_pkgbase='firefox-i18n'
_language='ca-valencia'
pkgname=("${_pkgbase}-${_language}")
pkgver=62.0
pkgrel=1
pkgdesc="Valencian language pack for Firefox"
arch=('any')
url="http://www.softvalencia.org/guies/firefox-en-valencia/"
license=('GPL' 'LGPL' 'MPL')
provides=("${pkgname}")
depends=("firefox>=$pkgver")
source=("https://addons.mozilla.org/firefox/downloads/file/1067065/firefox_en_valencia-${pkgver}-fx.xpi")
sha256sums=('8fb09ba62f5388e1a827c2c3a8250a5a245f5eb8923c2c0092fafe02816d1d99')

# Don't extract xpi
noextract=('firefox_en_valencia-${pkgver}-fx.xpi')

package() {
    cd "${srcdir}"
    install -D -m 644 firefox_en_valencia-${pkgver}-fx.xpi \
    "${pkgdir}/usr/lib/firefox/browser/extensions/langpack-${_language}@firefox.mozilla.org.xpi"
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
