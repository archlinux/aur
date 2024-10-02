# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek <swiftgeek ɐt gmail døt com>
# Maintainer: Sving1024 <piano5432@outlook.com>

pkgrel=1
arch=('any')
license=('MPL' 'GPL' 'LGPL')
url="https://www.mozilla.org/firefox/"
_url=https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi

_version=133.0a1
pkgver=133.0a1.20241002.095009

depends=("firefox-nightly-bin")

_language="Songhai"
_language_short=son
_pkgname_base=firefox-nightly-i18n
pkgname=${_pkgname_base}-${_language_short,,}
pkgdesc="${_language} language pack for Firefox Nightly"

groups=('firefox-nightly-i18n')
source=("${_pkgname_base}-${_language_short}.xpi::$_url/firefox-${_version}.${_language_short}.langpack.xpi")

# Don't extract anything
noextract=("${_pkgname_base}-${_language_short}.xpi")

sha256sums=('cf3a40be7a89395c158f903a274bba40b1b6757aad87081adc47c45032a4c05f')

package() {
  install -Dm644 "${_pkgname_base}-${_language_short}.xpi" \
      "$pkgdir/opt/firefox-nightly/distribution/extensions/langpack-${_language_short}@firefox.mozilla.org.xpi"
}
