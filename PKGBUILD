# Maintainer: Hezekiah Michael <spiritomb@protonmail.com>

_plugin_name=facebook_container
_plugin_version=2.3.9
_plugin_id=4024031
pkgdesc="Browser plugin to containerize Facebook and its affiliates."
license=('MPL')

pkgname=firefox-extension-facebook-container
pkgver=$_plugin_version
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/facebook-container/"
depends=("firefox>=67")
optdepends=("firefox-extension-multi-account-containers")
source=("https://addons.mozilla.org/firefox/downloads/file/${_plugin_id}/${_plugin_name}-${pkgver}.xpi")
noextract=('${_plugin_name}-${pkgver}.xpi')

package() {
  cd "${srcdir}"
  _extension_id="@contain-facebook"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 ${_plugin_name}-${pkgver}.xpi "${_extension_dest}.xpi"
}

sha256sums=('f4cdd84471e2f6d3195a3f90aa511b0aba7f138f888bd239d8cb71684611ef78')
