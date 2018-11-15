# Maintainer: GI_Jack <GI_Jack@hackermail.com>

# Please note this is NOT useragentswitcher by chris perderrik.
# It is unlikely that he will port to FF 57.

_plugin_name=user-agent-switcher
_plugin_version=1.2.0
_plugin_ext="-an+fx"
pkgdesc="Firefox extension to override the browser's User-Agent string"
license=('GPL')

pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
arch=('any')
url="https://gitlab.com/alexander255/user-agent-switcher"
depends=("firefox>=57")
source=("https://addons.mozilla.org/firefox/downloads/file/953860/user_agent_switcher-${pkgver}${_plugin_ext}.xpi")
noextract=('user_agent_switcher-${pkgver}${_plugin_ext}.xpi')
sha256sums=('dfaa82d5b16dbb937f73b43f87331945b92db47dc9360a327b0649297cfb6fbf')

https://addons.mozilla.org/firefox/downloads/file/953860/user_agent_switcher-${pkgver}${_plugin_ext}.xpi

package() {
  cd "${srcdir}"
  _extension_id="user-agent-switcher@ninetailed.ninja"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 user_agent_switcher-${pkgver}${_plugin_ext}.xpi "${_extension_dest}.xpi"
}
