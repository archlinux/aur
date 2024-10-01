# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek <swiftgeek ɐt gmail døt com>
# Maintainer: Sving1024 <piano5432@outlook.com>

pkgrel=1
arch=('any')
license=('MPL' 'GPL' 'LGPL')
url="https://www.mozilla.org/firefox/"
_url=https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi

_version=133.0a1
pkgver=133.0a1.20240930.215150

depends=("firefox-nightly-bin")

_language="Persian"
_language_short=fa
_pkgname_base=firefox-nightly-i18n
pkgname=${_pkgname_base}-${_language_short,,}
pkgdesc="${_language} language pack for Firefox Nightly"

groups=('firefox-nightly-i18n')
source=("${_pkgname_base}-${_language_short}.xpi::$_url/firefox-${_version}.${_language_short}.langpack.xpi")

# Don't extract anything
noextract=("${_pkgname_base}-${_language_short}.xpi")

sha256sums=('dbd2454632c111c90fb9ded6177cf99788eb23ca37ab1b113bf62bc67c9673ca')

package() {
  install -Dm644 "${_pkgname_base}-${_language_short}.xpi" \
      "$pkgdir/opt/firefox-nightly/distribution/extensions/langpack-${_language_short}@firefox.mozilla.org.xpi"
}
