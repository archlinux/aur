# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
#

_pkgname=mailvelope
pkgname=firefox-extension-${_pkgname}
pkgver=2.2.0
pkgrel=1
_file=883203
pkgdesc="Secure webmail communication based on the OpenPGP standard."
license=('GPL2')
arch=('any')
url="https://www.eff.org/https-everywhere"
depends=("firefox")
makedepends=("unzip")
source=("${_pkgname}-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/${_file}/${_pkgname/-/_}-${pkgver}-an+fx.xpi")
noextract=("${_pkgname}-${pkgver}.xpi")
sha256sums=('31445aa961f32191d656808e1dc4f8f643a10162806f41b54794cf97408412ab')

package() {
  cd "${srcdir}"
  _extension_id="jid1-AQqSMBYb0a8ADg@jetpack"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 ${_pkgname}-${pkgver}${_plugin_ext}.xpi "${_extension_dest}.xpi"
}
