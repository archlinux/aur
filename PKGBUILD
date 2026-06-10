# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek <swiftgeek ɐt gmail døt com>
# Maintainer: Sving1024 <sving1024@outlook.com>

pkgrel=1
arch=('any')
license=('MPL' 'GPL' 'LGPL')
url="https://www.mozilla.org/firefox/"
_url=https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi

_version=153.0a1
pkgver=153.0a1.20260610.101355

depends=("firefox-nightly")

_language="Khmer"
_language_short=km
_pkgname_base=firefox-nightly-i18n
pkgname=${_pkgname_base}-${_language_short,,}
pkgdesc="${_language} language pack for Firefox Nightly"

groups=('firefox-nightly-i18n')
source=("${_pkgname_base}-${_language_short}-${pkgver}.xpi::$_url/firefox-${_version}.${_language_short}.langpack.xpi")

# Don't extract anything
noextract=("${_pkgname_base}-${_language_short}-${pkgver}.xpi")

sha256sums=('6bb80e1e02e9cc8885bd7e16412d60bbf9156707099e1af2d62b50e39e171a61')

package() {
  install -Dm644 "${_pkgname_base}-${_language_short}-${pkgver}.xpi" \
      "$pkgdir/usr/lib/firefox-nightly/distribution/extensions/langpack-${_language_short}@firefox.mozilla.org.xpi"
}
