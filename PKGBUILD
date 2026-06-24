# Maintainer: Network_Jack <Network_Jack@null.net>

# Please note this is NOT useragentswitcher by chris perderrik.

_plugin_name=user-agent-switcher
_plugin_ext=""
_file=4772478

pkgname=firefox-extension-$_plugin_name
pkgver=1.4.102
pkgrel=1
arch=('any')
pkgdesc="Firefox extension to override the browser's User-Agent string"
license=('GPL')
url="https://gitlab.com/ntninja/user-agent-switcher"
depends=("firefox>=57")
source=("https://addons.mozilla.org/firefox/downloads/file/${_file}/uaswitcher-${pkgver}${_plugin_ext}.xpi")
noextract=('user_agent_switcher-${pkgver}${_plugin_ext}.xpi')
sha256sums=('b83c36fe95d44ecd5dd8611b4af87390aa7b8c653d637b3bb287c152e63da8c8')

package() {
  cd "${srcdir}"
  _extension_id="user-agent-switcher@ninetailed.ninja"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 uaswitcher-${pkgver}${_plugin_ext}.xpi "${_extension_dest}.xpi"
}
