# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=thunderbird-dav-4-tbsync
_name=DAV-4-TbSync
pkgver=4.2
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
sha512sums=('738bc083901c559a55a1bbb63041940226898534b5cd6ec33541d3f9bc61fa251e7a6e177d618bd0131e0f8ca809afc1372053b20654928791f9a0ec7c8bdc7a')

package() {
  _extension_id="dav4tbsync@jobisoft.de"
  _extension_dest="${pkgdir}/usr/lib/thunderbird/extensions/${_extension_id}"
  install -Dm644 "${srcdir}/${_name}-${pkgver}.xpi" "${_extension_dest}.xpi"
}
