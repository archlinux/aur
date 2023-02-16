# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=thunderbird-eas-4-tbsync
_file=1021719
_name=provider_fur_exchange_activesync
pkgver=4.2
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
source=("https://addons.thunderbird.net/thunderbird/downloads/file/${_file}/${_name}-${pkgver}-tb.xpi")
noextract=("${_name}-${pkgver}-tb.xpi")
sha512sums=('22627731e54d7eaa2377398a94d2a6653c239229c56c9e4e73e5a3d86aece1f9d3ecf4570b11de98d8f88a7f1929237328e5a6e2c26c1e1b75ec5e2f33596855')

package() {
  _extension_id="eas4tbsync@jobisoft.de"
  _extension_dest="${pkgdir}/usr/lib/thunderbird/extensions/${_extension_id}"
  install -Dm644 "${srcdir}/${_name}-${pkgver}-tb.xpi" "${_extension_dest}.xpi"
}
