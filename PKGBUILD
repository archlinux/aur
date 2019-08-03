# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

_plugin_name=keepassxc-browser
_plugin_version=1.4.7
_plugin_id=3367553
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

md5sums=('c53704582a4e5832cc6e6ce6b373c36d')
sha256sums=('534e36f3e5fa4678c44904dd6ce44a40fad63a1ea55f2ec115c80f435823b323')

package() {
  cd "${srcdir}"
  _extension_id="keepassxc-browser@keepassxc.org"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 keepassxc_browser-${pkgver}${_plugin_ext}.xpi "${_extension_dest}.xpi"
}
