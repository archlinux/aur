# Maintainer: Network_Jack <Network_Jack@null.net>

_plugin_name=foxyproxy
_plugin_version=9.8
_plugin_id=5029813
_plugin_ext=""
pkgdesc="FoxyProxy is an advanced proxy management tool that completely replaces Firefox's limited proxying capabilities."
license=('GPL')

pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/foxyproxy-standard/"
depends=("firefox>=57")
source=("https://addons.mozilla.org/firefox/downloads/file/${_plugin_id}/foxyproxy_standard-${pkgver}${_plugin_ext}.xpi")
noextract=('foxyproxy_standard-${pkgver}${_plugin_ext}.xpi')
sha256sums=('37350f3f57ea0f88ed12513fa233c4486c006ff352129d444a12da4e22280403')

package() {
  cd "${srcdir}"
  _extension_id="foxyproxy@eric.h.jung"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 foxyproxy_standard-${pkgver}${_plugin_ext}.xpi "${_extension_dest}.xpi"
}

