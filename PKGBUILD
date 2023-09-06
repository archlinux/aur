# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com>
# Contributor: Javier Tiá <javier dot tia at gmail dot com>

pkgname=thunderbird-tbsync
_name=tbsync
_file=1024208
pkgver=4.7
pkgrel=1
pkgdesc="Sync contacts, tasks and calendars to thunderbird using Exchange ActiveSync (EAS) and CalDAV/CardDAV"
arch=('any')
url="https://github.com/jobisoft/TbSync"
license=('MPL2')
groups=('office')
depends=('thunderbird>=102.3' 'thunderbird<116')
source=("https://addons.thunderbird.net/thunderbird/downloads/file/${_file}/${_name}-${pkgver}-tb.xpi")
noextract=("${_name}-${pkgver}-tb.xpi")
sha512sums=('d58a4243c6e2731cac45c66348f239b32d16456c265abd7c70e0644bd9e39071ff3ccf9da72d3860d9d367ea354a3a1ec65a0a0a14884b71342cfa1a306e3eaa')

package() {
  _extension_id="tbsync@jobisoft.de"
  _extension_dest="${pkgdir}/usr/lib/thunderbird/extensions/${_extension_id}"
  install -Dm644 "${srcdir}/${_name}-${pkgver}-tb.xpi" "${_extension_dest}.xpi"
}
