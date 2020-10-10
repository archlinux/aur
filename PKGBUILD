# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

_plugin_name=keepassxc-browser
_plugin_version=1.7.1
_plugin_id=3642246
_plugin_ext="-fx"
pkgdesc="Official browser plugin for the KeePassXC password manager."
license=('GPL')

pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/keepassxc-browser/"
depends=("firefox>=67" "keepassxc")
source=("https://addons.mozilla.org/firefox/downloads/file/${_plugin_id}/keepassxc_browser-${pkgver}${_plugin_ext}.xpi")
noextract=('keepassxc_browser-${pkgver}${_plugin_ext}.xpi')


package() {
  cd "${srcdir}"
  _extension_id="keepassxc-browser@keepassxc.org"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 keepassxc_browser-${pkgver}${_plugin_ext}.xpi "${_extension_dest}.xpi"
}

sha256sums=('d41974d26408bb8d573acb884c9273e3d023ae9fef78d8050d2b42d8a0b0fb3c')
