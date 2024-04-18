# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com>
# Contributor: Javier Tiá <javier dot tia at gmail dot com>

pkgname=thunderbird-tbsync
_name=tbsync
_file=1026865
pkgver=4.8
pkgrel=1
pkgdesc="Sync contacts, tasks and calendars to thunderbird using Exchange ActiveSync (EAS) and CalDAV/CardDAV"
arch=('any')
url="https://github.com/jobisoft/TbSync"
license=('MPL2')
groups=('office')
depends=('thunderbird>=115')
source=("https://addons.thunderbird.net/thunderbird/downloads/file/${_file}/${_name}-${pkgver}-tb.xpi")
noextract=("${_name}-${pkgver}-tb.xpi")
sha512sums=('57b53b608890e23fb1ec8d19e4fb8f726ae685b930d0b1449ca924652411c7859b940a310b5f49044b47bb7cf275936969d4d2d281ba838df9938c5b6b37b352')

package() {
  _extension_id="tbsync@jobisoft.de"
  _extension_dest="${pkgdir}/usr/lib/thunderbird/extensions/${_extension_id}"
  install -Dm644 "${srcdir}/${_name}-${pkgver}-tb.xpi" "${_extension_dest}.xpi"
}
