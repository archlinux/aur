# Maintainer: GI_Jack <iamjacksemail@hackermail.com>

# Please note this is NOT useragentswitcher by chris perderrik.
# It is unlikely that he will port to FF 57.

_plugin_name=user-agent-switcher
_plugin_version=1.1.2
_plugin_ext="-an+fx"
pkgdesc="Firefox extension to override the browser's User-Agent string"
license=('GPL')

pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
arch=('any')
url="https://gitlab.com/alexander255/user-agent-switcher"
depends=("firefox>=57")
source=("https://addons.mozilla.org/firefox/downloads/file/785722/user_agent_switcher-${pkgver}${_plugin_ext}.xpi")
noextract=('user_agent_switcher-${pkgver}${_plugin_ext}.xpi')
sha256sums=('68ee6e0aae370bf6c1aee0e5a070aa4b8f587487c0aedb76a6efece18d82c076')
package() {
  cd "${srcdir}"
  _extension_id="user-agent-switcher@ninetailed.ninja"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 user_agent_switcher-${pkgver}${_plugin_ext}.xpi "${_extension_dest}.xpi"
}
