# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
_pkgbase='firefox-i18n'
_language='ca-valencia'
pkgname=("${_pkgbase}-${_language}")
pkgver=60.0
pkgrel=1
pkgdesc="Valencian language pack for Firefox"
arch=('any')
url="http://www.softvalencia.org/guies/firefox-en-valencia/"
license=('GPL' 'LGPL' 'MPL')
provides=("${pkgname}")
depends=("firefox>=$pkgver")
source=("https://addons.mozilla.org/firefox/downloads/file/953386/firefox_en_valencia-${pkgver}-an+fx.xpi")
sha256sums=('32ed364c59060d1c256751bdabc3d1357dd24522db06397530d2f3993274a678')

# Don't extract xpi
noextract=('firefox_en_valencia-${pkgver}-an+fx.xpi')

package() {
    cd "${srcdir}"
    install -Dm644 "firefox_en_valencia-${pkgver}-an+fx.xpi" \
      "${pkgdir}/usr/lib/firefox/browser/extensions/langpack-${_language}@firefox.mozilla.org.xpi"
}

# vim: set ts=4 sw=2 et syn=sh ft=sh:
