# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
_pkgbase='firefox-i18n'
_language='ca-valencia'
pkgname=("${_pkgbase}-${_language}")
pkgver=61.0
pkgrel=2
pkgdesc="Valencian language pack for Firefox"
arch=('any')
url="http://www.softvalencia.org/guies/firefox-en-valencia/"
license=('GPL' 'LGPL' 'MPL')
provides=("${pkgname}")
depends=("firefox>=$pkgver")
source=("https://addons.mozilla.org/firefox/downloads/file/999128/firefox_en_valencia-${pkgver}-fx.xpi")
sha256sums=('d69354f9c7d760ea40ac6c5c552e69d9f5b857f77b54d183fec44564d4512d39')

# Don't extract xpi
noextract=('firefox_en_valencia-${pkgver}-fx.xpi')

package() {
    cd "${srcdir}"
    install -D -m 644 firefox_en_valencia-${pkgver}-fx.xpi \
    "${pkgdir}/usr/lib/firefox/browser/extensions/langpack-${_language}@firefox.mozilla.org.xpi"
}

# vim: set ts=4 sw=2 et syn=sh ft=sh:
