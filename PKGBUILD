# Maintainer: GI_Jack <GI_Jack@hackermail.com>

# Please note this is NOT useragentswitcher by chris perderrik.

_plugin_name=user-agent-switcher
_plugin_ext=""
_file=4171331

pkgname=firefox-extension-$_plugin_name
pkgver=1.4.28
pkgrel=1
arch=('any')
pkgdesc="Firefox extension to override the browser's User-Agent string"
license=('GPL')
url="https://gitlab.com/ntninja/user-agent-switcher"
depends=("firefox>=57")
source=("https://addons.mozilla.org/firefox/downloads/file/${_file}/uaswitcher-${pkgver}${_plugin_ext}.xpi")

noextract=('user_agent_switcher-${pkgver}${_plugin_ext}.xpi')
sha256sums=('861031f35ee003cc370b75c4b5e56ef2bfc493ac8b1985f28f510cebb4b71a37')

package() {
  cd "${srcdir}"
  _extension_id="user-agent-switcher@ninetailed.ninja"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 uaswitcher-${pkgver}${_plugin_ext}.xpi "${_extension_dest}.xpi"
}
