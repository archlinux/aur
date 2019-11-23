# Maintainer: GI_Jack <GI_Jack@hackermail.com>

_plugin_name=containerise
_plugin_version=3.7.0
_plugin_id=3432724
_plugin_ext="-fx"
pkgdesc="Automatically open websites in a container. Map multiple domains and subdomain to a container with simple csv based config"
license=('MIT')

pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/containerise/"
depends=("firefox>=53")
source=("https://addons.mozilla.org/firefox/downloads/file/${_plugin_id}/containerise-${pkgver}${_plugin_ext}.xpi")
noextract=("containerise-${pkgver}${_plugin_ext}.xpi")
sha256sums=('242226d3a24670d2ee85191c40e5df80c955fa5aae02ce56c28b965cf88dec11')

package() {
  cd "${srcdir}"
  _extension_id="containerise@kinte.sh"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 containerise-${pkgver}${_plugin_ext}.xpi "${_extension_dest}.xpi"
}

