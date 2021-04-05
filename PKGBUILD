# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

_plugin_name=keepassxc-browser
_plugin_version=1.7.7
_plugin_ext="-fx"
pkgdesc="Official browser plugin for the KeePassXC password manager."
license=('GPL')

pkgname=firefox-extension-$_plugin_name
pkgver=1.7.7
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/keepassxc-browser/"
depends=("firefox>=67" "keepassxc")
source=(keepassxc-browser-$pkgver${_plugin_ext}.xpi::"https://github.com/keepassxreboot/keepassxc-browser/releases/download/${pkgver}/keepassxc-browser_${pkgver}_firefox.zip")
noextract=('keepassxc-browser-${pkgver}${_plugin_ext}.xpi')

package() {
  cd "${srcdir}"
  _extension_id="keepassxc-browser@keepassxc.org"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 keepassxc-browser-${pkgver}${_plugin_ext}.xpi "${_extension_dest}.xpi"
}

sha256sums=('05f4849500e30b8a1dc3b06adf0c3849ca16f274f8e846af11fc86b16df44284')
