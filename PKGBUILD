# Maintainer: GI_Jack <GI_Jack@hackermail.com>

_plugin_name=foxyproxy
_plugin_version=8.9
_plugin_id=4228676
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
sha256sums=('b1e1b85f4b3b047560f5329040e14a2fec9699edd4706391f6f2318b203ab023')

package() {
  cd "${srcdir}"
  _extension_id="foxyproxy@eric.h.jung"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 foxyproxy_standard-${pkgver}${_plugin_ext}.xpi "${_extension_dest}.xpi"
}

