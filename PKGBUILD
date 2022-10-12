# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=thunderbird-dav-4-tbsync
_name=DAV-4-TbSync
pkgver=4.3
pkgrel=1
pkgdesc='Provider for CalDAV & CardDAV Version History'
arch=('any')
url="https://github.com/jobisoft/DAV-4-TbSync"
license=('MPL2')
groups=('office')
depends=(
  'thunderbird>=102.3.3'
  'thunderbird<103'
)
source=("${_name}-${pkgver}.xpi::https://github.com/jobisoft/${_name}/releases/download/v${pkgver}/${_name}.xpi")
noextract=("${_name}-${pkgver}.xpi")
sha512sums=('34e2593b1d35c5537218f4f93d09669550f11b9c196adee57815723aae3b78c15a11f933664a52f8da2d1d3bf9f0ec13a7aa9edaf2172c764536a25441ea5fdd')

package() {
  _extension_id="dav4tbsync@jobisoft.de"
  _extension_dest="${pkgdir}/usr/lib/thunderbird/extensions/${_extension_id}"
  install -Dm644 "${srcdir}/${_name}-${pkgver}.xpi" "${_extension_dest}.xpi"
}
