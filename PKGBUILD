# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
# Based on PKGBUILD firefox-extension-httpseverywhere

_plugin_name=trackmenot
_plugin_version=0.10.3
_file_name=addon-3173-latest.xpi
pkgdesc="Firefox extension to protect web habits from tracking and profiling"
license=('cc-by-nc-sa')
pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
arch=('any')
url="http://cs.nyu.edu/trackmenot/"
depends=("firefox")
#source=("https://addons.mozilla.org/firefox/downloads/latest/trackmenot/${_file_name}")
source=("https://addons.mozilla.org/firefox/downloads/file/793856/trackmenot-${_plugin_version}-an+fx.xpi")
noextract=('${_plugin_version}-an+fx.xpi') 
sha256sums=('bfa7ee310b850eeff66895a02a8f81802c6e00c11898b33a4b518aade74202eb')

package() {
  local _extension_id="trackmenot@mrl.nyu.edu"
  local _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"

  cd "${srcdir}"

  install -Dm644 "${_plugin_name}-${_plugin_version}-an+fx.xpi" "${_extension_dest}.xpi"
}

