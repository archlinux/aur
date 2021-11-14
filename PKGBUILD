# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=thunderbird-eas-4-tbsync
pkgver=2.0.1
pkgrel=1
_file=1019347
_name=provider_fur_exchange_activesync
pkgdesc='Provider for Exchange ActiveSync Version History'
arch=('any')
url='https://github.com/jobisoft/EAS-4-TbSync'
license=('MPL2')
groups=('office')
depends=(
  'thunderbird>=91'
  'thunderbird<92'
)
source=("https://addons.thunderbird.net/thunderbird/downloads/file/$_file/$_name-$pkgver-tb.xpi")
noextract=("$_name-$pkgver-tb.xpi")
sha512sums=('747fb68b814ef3f4d4b268833f399a71af478f400c619e79d88d9fd9a7845c78eda7cc49290cd3b69ff45b0feb23699ad26a3ede1dfae6c8b08c50a9c98fb745')

package() {
  _extension_id="eas4tbsync@jobisoft.de"
  _extension_dest="${pkgdir}/usr/lib/thunderbird/extensions/${_extension_id}"
  install -Dm644 "${srcdir}"/$_name-$pkgver-tb.xpi "${_extension_dest}.xpi"
}
