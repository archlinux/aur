# Maintainer: Jérémie Detrey <Jeremie.Detrey@loria.fr>
# Based on PKGBUILD firefox-extension-useragentswitcher

_plugin_name=tree_style_tab
_plugin_version=0.19.2017090601
_plugin_id=5890
_plugin_ext="-fx"
pkgdesc="Firefox extension to show tabs like a tree"
license=('MPL 1.1' 'GPL 2.0' 'LGPL 2.1')

pkgname=firefox-extension-tree-style-tab
pkgver=${_plugin_version}
pkgrel=1
arch=('any')
url="http://piro.sakura.ne.jp/xul/_treestyletab.html.en"
depends=("firefox>=52")
source=("https://addons.cdn.mozilla.net/user-media/addons/${_plugin_id}/${_plugin_name}-${pkgver}${_plugin_ext}.xpi")
sha256sums=('3adbb6d24d1f80c45176b4f2aac3e046341d38389a840d8f1fab83c4724a017c')

package() {
  cd "${srcdir}"
  _extension_id="$(sed -n '/.*em:id="\(.*\)".*/{s//\1/p;q}' install.rdf)"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 ${_plugin_name}-${pkgver}${_plugin_ext}.xpi "${_extension_dest}.xpi"
}
