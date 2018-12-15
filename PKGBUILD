# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
_pkgbase='firefox-i18n'
_language='ca-valencia'
pkgname=("${_pkgbase}-${_language}")
pkgver=64.0
pkgrel=1
pkgdesc="Valencian language pack for Firefox"
arch=('any')
url="http://www.softvalencia.org/guies/firefox-en-valencia/"
license=('GPL' 'LGPL' 'MPL')
provides=("${pkgname}")
depends=("firefox>=$pkgver")
source=("https://addons.mozilla.org/firefox/downloads/file/1181325/firefox_en_valencia-${pkgver}-fx.xpi")
sha256sums=('d8b788c9a8d9f69f57e9bb5a3b31e9e04f0967054d79b97c4bd01b517263c943')

# Don't extract xpi
noextract=('firefox_en_valencia-${pkgver}-fx.xpi')

package() {
    cd "${srcdir}"
    install -D -m 644 firefox_en_valencia-${pkgver}-fx.xpi \
    "${pkgdir}/usr/lib/firefox/browser/extensions/langpack-${_language}@firefox.mozilla.org.xpi"
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
