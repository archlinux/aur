# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

_plugin_name=keepassxc-browser
_plugin_version=1.5.4
_plugin_id=3465157
_plugin_ext="-fx"
pkgdesc="Official browser plugin for the KeePassXC password manager."
license=('GPL')

pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/keepassxc-browser/"
depends=("firefox>=52" "keepassxc")
source=("https://addons.mozilla.org/firefox/downloads/file/${_plugin_id}/keepassxc_browser-${pkgver}${_plugin_ext}.xpi")
noextract=('keepassxc_browser-${pkgver}${_plugin_ext}.xpi')

md5sums=('d96a6cc7736a8e7a174eccb1330d24cb')
sha256sums=('8a0b585e0921c67c5d9b5e19d0e2398e9893c4bdbd24c108af280df737c56f2f')

package() {
  cd "${srcdir}"
  _extension_id="keepassxc-browser@keepassxc.org"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 keepassxc_browser-${pkgver}${_plugin_ext}.xpi "${_extension_dest}.xpi"
}
