# Maintainer: Hezekiah Michael <spiritomb@protonmail.com>

_plugin_name=available_reads
_plugin_version=3.7.0
_plugin_id=1108779
_plugin_ext="-an+fx"
pkgdesc="Browser plugin to make Goodreads display Overdrive availability."
license=('GPL')

pkgname=firefox-extension-available-goodreads
pkgver=$_plugin_version
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/available-reads/"
depends=("firefox>=42")
optdepends=("firefox-extension-amazon-container")
source=("https://addons.mozilla.org/firefox/downloads/file/${_plugin_id}/${_plugin_name}-${pkgver}${_plugin_ext}.xpi")
noextract=('${_plugin_name}-${pkgver}${_plugin_ext}.xpi')

package() {
  cd "${srcdir}"
  _extension_id="{4bcad1d2-b119-4ade-9807-1c3d60039c24}"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 "${_plugin_name}-${pkgver}${_plugin_ext}.xpi" "${_extension_dest}.xpi"
}
sha256sums=('d060876863a52307a527e04d5ff322bf2ef99e1fbc7f309fe2cde1e28a398b10')

