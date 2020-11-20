# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com>
# Contributor: Javier Tiá <javier dot tia at gmail dot com>

pkgname=thunderbird-tbsync
pkgver=2.19
pkgrel=1
_file=1017830
_name=tbsync
pkgdesc="Sync contacts, tasks and calendars to thunderbird using Exchange ActiveSync (EAS) and CalDAV/CardDAV"
arch=('any')
url="https://github.com/jobisoft/TbSync"
license=('MPL-2.0')
groups=('office')
depends=('thunderbird>=78' 'thunderbird<79')
provides=("${_name}=${pkgver}")
source=("https://addons.thunderbird.net/thunderbird/downloads/file/$_file/$_name-$pkgver-tb.xpi")
noextract=("$_name-$pkgver-tb.xpi")
sha256sums=('1f1b5245e532d8ae216798435f610e46d4934447bdf5ede7561e93515a44fa16')

package() {
  _extension_id="tbsync@jobisoft.de"
  _extension_dest="${pkgdir}/usr/lib/thunderbird/extensions/${_extension_id}"
  install -Dm644 "${srcdir}"/$_name-$pkgver-tb.xpi "${_extension_dest}.xpi"
}
