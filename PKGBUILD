# Maintainer: Hezekiah Michael <spiritomb@protonmail.com>

_plugin_name=facebook_container
_plugin_version=2.0.3
_plugin_id=3414682
_plugin_ext="-fx"
pkgdesc="Browser plugin to containerize Facebook and its affiliates."
license=('MPL')

pkgname=firefox-extension-facebook-container
pkgver=$_plugin_version
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/facebook-container/"
depends=("firefox>=52")
optdepends=("firefox-extension-multi-account-containers")
source=("https://addons.mozilla.org/firefox/downloads/file/${_plugin_id}/${_plugin_name}-${pkgver}${_plugin_ext}.xpi")
noextract=('${_plugin_name}-${pkgver}${_plugin_ext}.xpi')

package() {
  cd "${srcdir}"
  _extension_id="@contain-facebook"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 ${_plugin_name}-${pkgver}${_plugin_ext}.xpi "${_extension_dest}.xpi"
}
sha256sums=('26d4b0541484ffc7364b8e429500a28bd71b9676bb92934e394661a5afcf160b')
