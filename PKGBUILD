# Maintainer: skrewball <jason at joickle dot com>

pkgname=gnome-shell-extension-hide-universal-access
pkgver=12
pkgrel=1
pkgdesc='Hide Universal Access icon from the Gnome status bar'
arch=(any)
url='https://github.com/akiirui/hide-universal-access'
license=('GPL3')
depends=('gnome-shell')
source=("https://extensions.gnome.org/extension-data/hide-universal-accessakiirui.github.io.v${pkgver}.shell-extension.zip")
sha256sums=('43f1b7baadccd2f52013420f2f470558c26f5c4ae1b04a0b7a2870ceafb3cbe8')

package() {
  local _uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
  install -Dm644 -t "${_destdir}" metadata.json *.js
}
