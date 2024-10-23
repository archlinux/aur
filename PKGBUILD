# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek <swiftgeek ɐt gmail døt com>
# Maintainer: Sving1024 <piano5432@outlook.com>

pkgrel=1
arch=('any')
license=('MPL' 'GPL' 'LGPL')
url="https://www.mozilla.org/firefox/"
_url=https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi

_version=133.0a1
pkgver=133.0a1.20241023.093655

depends=("firefox-nightly")

_language="Romansh"
_language_short=rm
_pkgname_base=firefox-nightly-i18n
pkgname=${_pkgname_base}-${_language_short,,}
pkgdesc="${_language} language pack for Firefox Nightly"

groups=('firefox-nightly-i18n')
source=("${_pkgname_base}-${_language_short}-${pkgver}.xpi::$_url/firefox-${_version}.${_language_short}.langpack.xpi")

# Don't extract anything
noextract=("${_pkgname_base}-${_language_short}-${pkgver}.xpi")

sha256sums=('fdce76f43d95484acad7cb6d4e337b9c91c9221083bc3424498a79f9a63c795c')

package() {
  install -Dm644 "${_pkgname_base}-${_language_short}-${pkgver}.xpi" \
      "$pkgdir/usr/lib/firefox-nightly/distribution/extensions/langpack-${_language_short}@firefox.mozilla.org.xpi"
}
