# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com>
# Contributor: Javier Tiá <javier dot tia at gmail dot com>

pkgname=thunderbird-tbsync
_name=tbsync
_file=1023906
pkgver=4.6
pkgrel=1
pkgdesc="Sync contacts, tasks and calendars to thunderbird using Exchange ActiveSync (EAS) and CalDAV/CardDAV"
arch=('any')
url="https://github.com/jobisoft/TbSync"
license=('MPL2')
groups=('office')
depends=('thunderbird>=102.3' 'thunderbird<116')
source=("https://addons.thunderbird.net/thunderbird/downloads/file/${_file}/${_name}-${pkgver}-tb.xpi")
noextract=("${_name}-${pkgver}-tb.xpi")
sha512sums=('b93f529b9e30465f6705007397adbca5e966de797cd1c89f02101641aca568ffa883f44b80356e991873e9e3559215abc9e7018208a988fd0a642c1a27d2453f')

package() {
  _extension_id="tbsync@jobisoft.de"
  _extension_dest="${pkgdir}/usr/lib/thunderbird/extensions/${_extension_id}"
  install -Dm644 "${srcdir}/${_name}-${pkgver}-tb.xpi" "${_extension_dest}.xpi"
}
