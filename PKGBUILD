# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=thunderbird-eas-4-tbsync
_name=EAS-4-TbSync
pkgver=4.1.5
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
sha512sums=('aaa700fc1e03108ad8cb401c947068c65b441a0444a88d88d48113c997ff17a763e0ba8e577f36bae840ee216be00565311569c8bd2f98f2576cedf7e7f05be2')

package() {
  _extension_id="eas4tbsync@jobisoft.de"
  _extension_dest="${pkgdir}/usr/lib/thunderbird/extensions/${_extension_id}"
  install -Dm644 "${srcdir}/${_name}-${pkgver}.xpi" "${_extension_dest}.xpi"
}
