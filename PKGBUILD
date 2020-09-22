# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com>
# Contributor: Javier Tiá <javier dot tia at gmail dot com>

pkgname=thunderbird-tbsync
pkgver=2.12
pkgrel=1
_file=1016743
_name=tbsync
pkgdesc="Sync contacts, tasks and calendars to thunderbird using Exchange ActiveSync (EAS) and CalDAV/CardDAV"
arch=('any')
url="https://github.com/jobisoft/TbSync"
license=('MPL-2.0')
groups=('office')
depends=('thunderbird>=68' 'thunderbird<69')
conflicts=("${pkgname}-beta")
provides=("${_name}=${pkgver}")
# https://addons.mozilla.org/en-US/firefox/addon/adblock-plus/versions/
source=("https://addons.thunderbird.net/thunderbird/downloads/file/$_file/$_name-$pkgver-tb.xpi")
noextract=("$_name-$pkgver-tb.xpi")
sha256sums=('d7e28222b569b50d6e624c8a6cfa1808956b8b8e0c64211d03fabf8d5acd857a')

package() {
  _extension_id="tbsync@jobisoft.de"
  _extension_dest="${pkgdir}/usr/lib/thunderbird/extensions/${_extension_id}"
  install -Dm644 "${srcdir}"/$_name-$pkgver-tb.xpi "${_extension_dest}.xpi"
}
