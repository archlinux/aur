# Maintainer: Hezekiah Michael <spiritomb@protonmail.com>

_plugin_name=bypass_paywalls
_plugin_version=1.6.6
_plugin_ext="-an+fx"
pkgdesc="Browser plugin to bypass paywalls on many news sites."
license=('MIT')

pkgname=firefox-extension-bypass-paywalls
pkgver=$_plugin_version
pkgrel=1
arch=('any')
url="https://github.com/iamadamdev/bypass-paywalls-firefox/"
depends=("firefox")
optdepends=("firefox-ublock-origin")
source=("https://github.com/iamadamdev/bypass-paywalls-firefox/releases/download/v${pkgver}/${_plugin_name}-${pkgver}${_plugin_ext}.xpi")
noextract=('${_plugin_name}-${pkgver}${_plugin_ext}.xpi')

package() {
  cd "${srcdir}"
  _extension_id="bypasspaywalls@bypasspaywalls.weebly.com"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 ${_plugin_name}-${pkgver}${_plugin_ext}.xpi "${_extension_dest}.xpi"
}
sha256sums=('100f44a9406799c97cf09baeb8862152e73d1e78717a5823555609b51a0bdeb4')
