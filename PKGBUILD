# Maintainer: Network_Jack <Network_Jack@null.net>

_plugin_name=knockoff
_plugin_version=0.4.0
_plugin_id=4890568
_plugin_ext=""
pkgdesc="Filters pseudo-brand junk out of Amazon and can hide sponsored listings. Buy from real, established brands"
license=('GPL')

pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
arch=('any')
url="https://knockoff.shopping/"
depends=("firefox>=57")
source=("https://addons.mozilla.org/firefox/downloads/file/${_plugin_id}/knockoff_amazon_brand_filter-${pkgver}${_plugin_ext}.xpi")
noextract=('knockoff_amazon_brand_filter-${pkgver}${_plugin_ext}.xpi')
sha256sums=('4478e8db2617a903541588f1b7408037d2c07b729d5fd3052a4d3ddb46ef2a75')

package() {
  cd "${srcdir}"
  _extension_id="knockoff@knockoff.shopping"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 knockoff_amazon_brand_filter-${pkgver}${_plugin_ext}.xpi "${_extension_dest}.xpi"
}


