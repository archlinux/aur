# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=thunderbird-eas-4-tbsync
_file=1021786
_name=provider_fur_exchange_activesync
pkgver=4.3
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
source=("https://addons.thunderbird.net/thunderbird/downloads/file/${_file}/${_name}-${pkgver}-tb.xpi")
noextract=("${_name}-${pkgver}-tb.xpi")
sha512sums=('e503b1c37c754431c12776894f407c6f9fe9096e1673ed7ca8d4c1e92cd5f354f70653db8894eeced763d68572dd3d9d5c616c99a9c1906878ce8c31e93fb17f')

package() {
  _extension_id="eas4tbsync@jobisoft.de"
  _extension_dest="${pkgdir}/usr/lib/thunderbird/extensions/${_extension_id}"
  install -Dm644 "${srcdir}/${_name}-${pkgver}-tb.xpi" "${_extension_dest}.xpi"
}
