# Maintainer: GI_Jack <GI_Jack@hackermail.com>

_plugin_name=foxyproxy
_plugin_version=7.4.3
_plugin_id=3476518
_plugin_ext="-an+fx"
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
sha256sums=('a8372bf0bda1afd27fd1300fdea49991c3bd25fd6a72225a680ba9d102c767a7')

package() {
  cd "${srcdir}"
  _extension_id="foxyproxy@eric.h.jung"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 foxyproxy_standard-${pkgver}${_plugin_ext}.xpi "${_extension_dest}.xpi"
}

