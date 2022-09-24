# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=thunderbird-eas-4-tbsync
_name=EAS-4-TbSync
pkgver=4.1.2
pkgrel=1
pkgdesc='Provider for Exchange ActiveSync Version History'
arch=('any')
url='https://github.com/jobisoft/EAS-4-TbSync'
license=('MPL2')
groups=('office')
depends=(
  'thunderbird>=102'
  'thunderbird<103'
)
source=("${_name}-${pkgver}.xpi::https://github.com/jobisoft/${_name}/releases/download/v${pkgver}/${_name}.xpi")
noextract=("${_name}-${pkgver}.xpi")
sha512sums=('4ed1180f2abc1dc294d8c44179ae371603d5bc357c4a27e0fd44c13027fe66039125ad6e6eea3cfd8180a057bb662e076abd8f4689b3b0dd86f19e77c8468ac2')

package() {
  _extension_id="eas4tbsync@jobisoft.de"
  _extension_dest="${pkgdir}/usr/lib/thunderbird/extensions/${_extension_id}"
  install -Dm644 "${srcdir}/${_name}-${pkgver}.xpi" "${_extension_dest}.xpi"
}
