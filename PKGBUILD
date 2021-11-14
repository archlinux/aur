# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=thunderbird-dav-4-tbsync
pkgver=2.0.2
pkgrel=1
_file=1019346
_name=provider_fur_caldav_carddav
pkgdesc='Provider for CalDAV & CardDAV Version History'
arch=('any')
url="https://github.com/jobisoft/DAV-4-TbSync"
license=('MPL2')
groups=('office')
depends=(
  'thunderbird>=91'
  'thunderbird<92'
)
source=("https://addons.thunderbird.net/thunderbird/downloads/file/$_file/$_name-$pkgver-tb.xpi")
noextract=("$_name-$pkgver-tb.xpi")
sha512sums=('469856c7a817d62b5e73324788366f068f866c4fdd6251a82afec1fc62585d175d520a26ee5aff0ba868c7ca41dd2020f6613f00b98215ad86f7b96ca5240c23')

package() {
  _extension_id="dav4tbsync@jobisoft.de"
  _extension_dest="${pkgdir}/usr/lib/thunderbird/extensions/${_extension_id}"
  install -Dm644 "${srcdir}"/$_name-$pkgver-tb.xpi "${_extension_dest}.xpi"
}
