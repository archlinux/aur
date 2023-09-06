# Maintainer: chripede <chripede at gmail dot com>

pkgname=gnome-shell-extension-hide-universal-access
pkgver=16
pkgrel=1
pkgdesc='Hide Universal Access icon from the Gnome status bar'
arch=(any)
url='https://github.com/akiirui/hide-universal-access'
license=('GPL3')
depends=('gnome-shell')
source=("https://extensions.gnome.org/extension-data/hide-universal-accessakiirui.github.io.v${pkgver}.shell-extension.zip")
sha256sums=('38cdb355d889a96e3b49553838d14d6570fdc454a727212fedb75ce19c6b2879')

package() {
  local _uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
  install -Dm644 -t "${_destdir}" metadata.json *.js
}
