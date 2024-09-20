# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com>
# Contributor: Javier Tiá <javier dot tia at gmail dot com>

# https://addons.thunderbird.net/thunderbird/downloads/file/1031856/tbsync-4.11-tb.xpi?src=version-history
pkgname=thunderbird-tbsync
_name=tbsync
_file=1031856
pkgver=4.11
pkgrel=1
pkgdesc="Sync contacts, tasks and calendars to thunderbird using Exchange ActiveSync (EAS) and CalDAV/CardDAV"
arch=('any')
url="https://github.com/jobisoft/TbSync"
license=('MPL2')
groups=('office')
depends=('thunderbird>=128')
source=("https://addons.thunderbird.net/thunderbird/downloads/file/${_file}/${_name}-${pkgver}-tb.xpi")
noextract=("${_name}-${pkgver}-tb.xpi")
sha512sums=('4e9db58866baa6ffa0811896566c846772fb7a3886db5fc4b14785e59661d3e9d4f868a522e5788a67fede0f2076ba9d0b2ca0b049872838a9aea42c6c67ad48')

package() {
  _extension_id="tbsync@jobisoft.de"
  _extension_dest="${pkgdir}/usr/lib/thunderbird/extensions/${_extension_id}"
  install -Dm644 "${srcdir}/${_name}-${pkgver}-tb.xpi" "${_extension_dest}.xpi"
}
