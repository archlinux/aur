# Maintainer: Hezekiah Michael <spiritomb@protonmail.com>

_plugin_name=facebook_container
_plugin_version=2.1.1
_plugin_id=3548655
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

sha256sums=('b8cca6d366bf1aa601cd8f0e4e6c51443e067e32c62900293aebea58ff11825d')
