# Maintainer: GI_Jack <GI_Jack@hackermail.com>

# Please note this is NOT useragentswitcher by chris perderrik.

_plugin_name=user-agent-switcher
_plugin_version=1.2.18
_plugin_ext="-an+fx"
pkgdesc="Firefox extension to override the browser's User-Agent string"
license=('GPL')

pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
arch=('any')
url="https://gitlab.com/alexander255/user-agent-switcher"
depends=("firefox>=57")
source=("https://addons.mozilla.org/firefox/downloads/file/3061197/user_agent_switcher-${pkgver}${_plugin_ext}.xpi")
noextract=('user_agent_switcher-${pkgver}${_plugin_ext}.xpi')
sha256sums=('83fd41a86df61a0e01c2a197b3670f8b7820e2d4e2814da01a296835d73efe42')

package() {
  cd "${srcdir}"
  _extension_id="user-agent-switcher@ninetailed.ninja"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 user_agent_switcher-${pkgver}${_plugin_ext}.xpi "${_extension_dest}.xpi"
}
