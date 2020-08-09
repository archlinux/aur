# Maintainer: GI_Jack <GI_Jack@hackermail.com>

# Please note this is NOT useragentswitcher by chris perderrik.

_plugin_name=user-agent-switcher
_plugin_ext="-an+fx"
_file=3621901

pkgname=firefox-extension-$_plugin_name
pkgver=1.3.40
pkgrel=1
arch=('any')
pkgdesc="Firefox extension to override the browser's User-Agent string"
license=('GPL')
url="https://gitlab.com/alexander255/user-agent-switcher"
depends=("firefox>=57")
source=("https://addons.mozilla.org/firefox/downloads/file/${_file}/user_agent_switcher-${pkgver}${_plugin_ext}.xpi")
noextract=('user_agent_switcher-${pkgver}${_plugin_ext}.xpi')
sha256sums=('5fb9976fb073d93583613b71e9cef5cd25907de3450bdfe04fa54e60b23cb717')

package() {
  cd "${srcdir}"
  _extension_id="user-agent-switcher@ninetailed.ninja"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 user_agent_switcher-${pkgver}${_plugin_ext}.xpi "${_extension_dest}.xpi"
}
