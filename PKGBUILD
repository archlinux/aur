# Maintainer: GI_Jack <GI_Jack@hackermail.com>
# Based on PKGBUILD firefox-extension-httpseverywhere

_plugin_name=trackmenot
_plugin_version=0.10.41
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
source=("https://addons.mozilla.org/firefox/downloads/file/1017009/trackmenot-${_plugin_version}-an+fx.xpi")

noextract=('${_plugin_version}-an+fx.xpi') 
sha256sums=('12975276e5aa69ce6522ab3156fb4cc23162d990e82a9ecd9508671c2544747a')

package() {
  local _extension_id="trackmenot@mrl.nyu.edu"
  local _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"

  cd "${srcdir}"

  install -Dm644 "${_plugin_name}-${_plugin_version}-an+fx.xpi" "${_extension_dest}.xpi"
}

