# Maintainer: Hezekiah Michael <spiritomb@protonmail.com>

_plugin_name=facebook_container
_plugin_version=2.1.2
_plugin_id=3650887
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

sha256sums=('86c75e90ae6f3f59999406c34229f05d563e024e293dfcabcfea10c75ce76cf7')
