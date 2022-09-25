# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=thunderbird-eas-4-tbsync
_name=EAS-4-TbSync
pkgver=4.1.3
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
sha512sums=('bf7edd9fddf307e226690e6f3fe839955827e17af5bb7b806b3c706ebd5be47ef28a51942fc074fdbe124f02045953cb84d18251e163ec5894b33b0292854dfb')

package() {
  _extension_id="eas4tbsync@jobisoft.de"
  _extension_dest="${pkgdir}/usr/lib/thunderbird/extensions/${_extension_id}"
  install -Dm644 "${srcdir}/${_name}-${pkgver}.xpi" "${_extension_dest}.xpi"
}
