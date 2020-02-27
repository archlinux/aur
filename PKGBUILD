# Maintainer: Hezekiah Michael <spiritomb@protonmail.com>

_plugin_name=amazon-container
_plugin_version=2.0.0
_plugin_id=3455930
_plugin_ext="-fx"
pkgdesc="Browser plugin to containerize Amazon and its affiliates."
license=('MPL')

pkgname=firefox-extension-${_plugin_name}
pkgver=$_plugin_version
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/contain-amazon/"
depends=("firefox>=52")
optdepends=("firefox-extension-multi-account-containers")
source=("https://addons.mozilla.org/firefox/downloads/file/${_plugin_id}/amazon_container-${pkgver}${_plugin_ext}.xpi")
noextract=('amazon_container-${pkgver}${_plugin_ext}.xpi')

package() {
  cd "${srcdir}"
  _extension_id="@contain-amzn"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 amazon_container-${pkgver}${_plugin_ext}.xpi "${_extension_dest}.xpi"
}
sha256sums=('0e61c08586f51852824962f9ca2f4d8fc9e4286f3e2a44111aede9644234b1c0')
