# Maintainer: Network Jack <Network_Jack@null.net>

# Please note this is NOT useragentswitcher by chris perderrik.

_plugin_name=user-agent-switcher
_plugin_ext=""
_file=4449854
pkgname=librewolf-extension-$_plugin_name
pkgver=1.4.89
pkgrel=1
arch=('any')
pkgdesc="Firefox extension to override the browser's User-Agent string"
license=('GPL')
url="https://gitlab.com/ntninja/user-agent-switcher"
depends=("librewolf>=57")
source=("https://addons.mozilla.org/firefox/downloads/file/${_file}/uaswitcher-${pkgver}${_plugin_ext}.xpi")

noextract=('user_agent_switcher-${pkgver}${_plugin_ext}.xpi')
sha256sums=('ad488274976139ce84517a3e12de6b729edfb8daded18c7184ffc64b90591a0a')

package() {
  cd "${srcdir}"
  _extension_id="user-agent-switcher@ninetailed.ninja"
  _extension_dest="${pkgdir}/usr/lib/librewolf/browser/extensions/${_extension_id}"
  install -Dm644 uaswitcher-${pkgver}${_plugin_ext}.xpi "${_extension_dest}.xpi"
}
