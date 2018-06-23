# Maintainer: GI_Jack <iamjacksemail@hackermail.com>

_pkgname=mailvelope
pkgname=firefox-extension-${_pkgname}
pkgver=2.2.2
pkgrel=1
_file=956348
pkgdesc="Secure webmail communication based on the OpenPGP standard."
license=('GPL2')
arch=('any')
url="https://www.mailvelope.com"
depends=("firefox")
makedepends=("unzip")
source=("${_pkgname}-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/${_file}/${_pkgname}-${pkgver}-an+fx.xpi")
noextract=("${_pkgname}-${pkgver}.xpi")
sha256sums=('124696797e8742a791f05bc14134e85107b66d66c4f090bb4552a56801e55a7b')

package() {
  cd "${srcdir}"
  _extension_id="jid1-AQqSMBYb0a8ADg@jetpack"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 ${_pkgname}-${pkgver}${_plugin_ext}.xpi "${_extension_dest}.xpi"
}
