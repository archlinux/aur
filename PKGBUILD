# Maintainer: Hezekiah Michael <spiritomb@protonmail.com>

_plugin_name=facebook_container
_plugin_version=2.3.2
_plugin_id=3923300
_plugin_ext="-fx"
pkgdesc="Browser plugin to containerize Facebook and its affiliates."
license=('MPL')

pkgname=firefox-extension-facebook-container
pkgver=$_plugin_version
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/facebook-container/"
depends=("firefox>=67")
optdepends=("firefox-extension-multi-account-containers")
source=("https://addons.mozilla.org/firefox/downloads/file/${_plugin_id}/${_plugin_name}-${pkgver}${_plugin_ext}.xpi")
noextract=('${_plugin_name}-${pkgver}${_plugin_ext}.xpi')

package() {
  cd "${srcdir}"
  _extension_id="@contain-facebook"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 ${_plugin_name}-${pkgver}${_plugin_ext}.xpi "${_extension_dest}.xpi"
}

sha256sums=('a1851f15ae4ec790c40f9a751ad6d64a44a6bf47f70ee497ef4ee17115bb7e06')
