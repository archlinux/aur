# Maintainer: skrewball <jason at joickle dot com>

pkgname=gnome-shell-extension-hide-universal-access
pkgver=11
pkgrel=1
pkgdesc='Hide Universal Access icon from the Gnome status bar'
arch=(any)
url='https://github.com/akiirui/hide-universal-access'
license=('GPL3')
depends=('gnome-shell')
source=("https://extensions.gnome.org/extension-data/hide-universal-accessakiirui.github.io.v${pkgver}.shell-extension.zip")
sha256sums=('f4917ed6da567589aa55a5879ee9116c09633c0e65b5bcc4a0390651f02074fb')

package() {
  local _uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
  install -Dm644 -t "${_destdir}" metadata.json *.js
}
