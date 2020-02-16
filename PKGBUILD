# Maintainer: GI_Jack <GI_Jack@hackermail.com>
# Based on PKGBUILD firefox-extension-httpseverywhere

_plugin_name=trackmenot
_file=3438065
pkgname=firefox-extension-${_plugin_name}
pkgver=0.10.46
pkgrel=1
pkgdesc="Firefox extension to protect web habits from tracking and profiling"
license=('cc-by-nc-sa')
arch=('any')
url="http://cs.nyu.edu/trackmenot/"
depends=("firefox")
source=("https://addons.mozilla.org/firefox/downloads/file/${_file}/trackmenot-${pkgver}-an+fx.xpi")

noextract=("${pkgver}-an+fx.xpi") 
sha256sums=('f5ed9cd2432543e22213ee0e79bc66941fc6802a357a6ae9cca2dcbe8e4d124c')

package() {
  local _extension_id="trackmenot@mrl.nyu.edu"
  local _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"

  cd "${srcdir}"

  install -Dm644 "${_plugin_name}-${pkgver}-an+fx.xpi" "${_extension_dest}.xpi"
}

