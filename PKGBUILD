# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

_plugin_name=keepassxc-browser
_plugin_version=1.5.3
_plugin_id=3423599
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

sha256sums=('e15fe9ecc3e24c57ba0741d015a65a1d8d9d3e93c5a921453c6c37ade78ef0fd')

package() {
  cd "${srcdir}"
  _extension_id="keepassxc-browser@keepassxc.org"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 keepassxc_browser-${pkgver}${_plugin_ext}.xpi "${_extension_dest}.xpi"
}
