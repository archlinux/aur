# Maintainer: GI_Jack <GI_Jack@hackermail.com>

_plugin_name=foxyproxy
_plugin_version=9.2
_plugin_id=4472757
_plugin_ext=""
pkgdesc="FoxyProxy is an advanced proxy management tool that completely replaces LibreWolf's limited proxying capabilities."
license=('GPL')

pkgname=librewolf-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/foxyproxy-standard/"
depends=("librewolf>=57")
source=("https://addons.mozilla.org/firefox/downloads/file/${_plugin_id}/foxyproxy_standard-${pkgver}${_plugin_ext}.xpi")
noextract=('foxyproxy_standard-${pkgver}${_plugin_ext}.xpi')
sha256sums=('8db1c64799a60f7121d51a6e9f6b041871598344927c95afe830c27880f0885d')

package() {
  cd "${srcdir}"
  _extension_id="foxyproxy@eric.h.jung"
  _extension_dest="${pkgdir}/usr/lib/librewolf/browser/extensions/${_extension_id}"
  install -Dm644 foxyproxy_standard-${pkgver}${_plugin_ext}.xpi "${_extension_dest}.xpi"
}

