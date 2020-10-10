# Maintainer: Hezekiah Michael <spiritomb@protonmail.com>

_plugin_name=bypass_paywalls
_plugin_version=1.7.6
_plugin_ext="-an+fx"
pkgdesc="Browser plugin to bypass paywalls on many news sites."
license=('MIT')

pkgname=firefox-extension-bypass-paywalls
pkgver=$_plugin_version
pkgrel=1
arch=('any')
url="https://github.com/iamadamdev/bypass-paywalls-chrome/"
depends=("firefox")
optdepends=("firefox-ublock-origin")
source=("${_plugin_name}-${pkgver}${_plugin_ext}.xpi::https://github.com/iamadamdev/bypass-paywalls-chrome/releases/download/v${pkgver}/bypass-paywalls-firefox.xpi")

noextract=('${_plugin_name}-${pkgver}${_plugin_ext}.xpi')

package() {
  cd "${srcdir}"
  _extension_id="bypasspaywalls@bypasspaywalls.weebly.com"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 ${_plugin_name}-${pkgver}${_plugin_ext}.xpi "${_extension_dest}.xpi"
}
sha256sums=('788e60e468a98067c1a700a3b2871ecd75ee0493ef2f0678223d28f53bcda767')
