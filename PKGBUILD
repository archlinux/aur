# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com>
# Contributor: Javier Tiá <javier dot tia at gmail dot com>

pkgname=thunderbird-tbsync
_name=tbsync
_file=1023901
pkgver=4.5
pkgrel=1
pkgdesc="Sync contacts, tasks and calendars to thunderbird using Exchange ActiveSync (EAS) and CalDAV/CardDAV"
arch=('any')
url="https://github.com/jobisoft/TbSync"
license=('MPL2')
groups=('office')
depends=('thunderbird>=102.3' 'thunderbird<116')
source=("https://addons.thunderbird.net/thunderbird/downloads/file/${_file}/${_name}-${pkgver}-tb.xpi")
noextract=("${_name}-${pkgver}-tb.xpi")
sha512sums=('348fddc9e0d322160de9e6bd173a4ecfc03af5d1084df2ff6cb7bcbe4b50bb982a47531590c32645599015a3c8cfebc737b74a22c55cb824475e42660fa852c6')

package() {
  _extension_id="tbsync@jobisoft.de"
  _extension_dest="${pkgdir}/usr/lib/thunderbird/extensions/${_extension_id}"
  install -Dm644 "${srcdir}/${_name}-${pkgver}-tb.xpi" "${_extension_dest}.xpi"
}
