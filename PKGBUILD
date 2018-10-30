# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
_pkgbase='firefox-i18n'
_language='ca-valencia'
pkgname=("${_pkgbase}-${_language}")
pkgver=63.0
pkgrel=1
pkgdesc="Valencian language pack for Firefox"
arch=('any')
url="http://www.softvalencia.org/guies/firefox-en-valencia/"
license=('GPL' 'LGPL' 'MPL')
provides=("${pkgname}")
depends=("firefox>=$pkgver")
source=("https://addons.mozilla.org/firefox/downloads/file/1120661/firefox_en_valencia-${pkgver}-fx.xpi")
sha256sums=('e81a3547da63a3d2c383dad92695b171b910699bd7d3d28ff4d6538f16fea18e')

# Don't extract xpi
noextract=('firefox_en_valencia-${pkgver}-fx.xpi')

package() {
    cd "${srcdir}"
    install -D -m 644 firefox_en_valencia-${pkgver}-fx.xpi \
    "${pkgdir}/usr/lib/firefox/browser/extensions/langpack-${_language}@firefox.mozilla.org.xpi"
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
