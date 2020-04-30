# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

_plugin_name=keepassxc-browser
_plugin_version=1.6.3
_plugin_id=3558577
_plugin_ext="-fx"
pkgdesc="Official browser plugin for the KeePassXC password manager."
license=('GPL')

pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/keepassxc-browser/"
depends=("firefox>=67" "keepassxc")
source=("https://addons.mozilla.org/firefox/downloads/file/${_plugin_id}/keepassxc_browser-${pkgver}${_plugin_ext}.xpi")
noextract=('keepassxc_browser-${pkgver}${_plugin_ext}.xpi')

md5sums=('41500fc5b31e1c73399abf7aab1887bf')
sha256sums=('e7502d44b3fc83a2e0514bafec3227b55c8fb647055f2f28e5304cc8ad247019')

package() {
  cd "${srcdir}"
  _extension_id="keepassxc-browser@keepassxc.org"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 keepassxc_browser-${pkgver}${_plugin_ext}.xpi "${_extension_dest}.xpi"
}
