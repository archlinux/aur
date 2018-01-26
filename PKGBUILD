# Maintainer: Jérémie Detrey <Jeremie.Detrey@loria.fr>
# Based on PKGBUILD firefox-extension-useragentswitcher

_plugin_name=tree_style_tab
_plugin_version=2.4.5
_plugin_id=5890
_plugin_filename="${_plugin_name}-${_plugin_version}-an+fx-linux"

pkgdesc="Firefox extension to show tabs like a tree"
license=('MPL 1.1' 'GPL 2.0' 'LGPL 2.1')

pkgname=firefox-extension-tree-style-tab
pkgver=${_plugin_version}
pkgrel=1
arch=('any')
url="http://piro.sakura.ne.jp/xul/_treestyletab.html.en"
depends=("firefox>=57")
source=("https://addons.cdn.mozilla.net/user-media/addons/${_plugin_id}/${_plugin_filename}.xpi")
noextract=("${_plugin_filename}.xpi")
sha256sums=('427d6fe83ca60ecd399a3ff18a042521a7ffa1e60da661b27ed416ba965b87f2')

package() {
  cd "${srcdir}"
  _extension_id="treestyletab@piro.sakura.ne.jp"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 ${_plugin_filename}.xpi "${_extension_dest}.xpi"
}
