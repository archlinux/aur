# Maintainer: Jérémie Detrey <Jeremie.Detrey@loria.fr>
# Based on PKGBUILD firefox-extension-useragentswitcher

_plugin_name=tree_style_tab
_plugin_version=2.2.3
_plugin_id=5890
_plugin_filename="${_plugin_name}-${_plugin_version}-an+fx"

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
sha256sums=('65ba805eb99103d8f57208fc4d594e2e834834698997aa8846b9b114de2feeb0')

package() {
  cd "${srcdir}"
  _extension_id="treestyletab@piro.sakura.ne.jp"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 ${_plugin_filename}.xpi "${_extension_dest}.xpi"
}
