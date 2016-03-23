# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=gnome-shell-extension-drop-down-terminal
pkgver=20
pkgrel=1
pkgdesc="Drop Down Terminal extension for the Gnome Shell"
arch=('any')
url="https://github.com/zzrough/gs-extensions-drop-down-terminal"
license=('GPL3')
depends=('gnome-shell')
install=${pkgname}.install
source=("https://github.com/zzrough/gs-extensions-drop-down-terminal/archive/v${pkgver}.tar.gz")
sha256sums=('17192234cd792109cdbf6003df08b8cc8b0ed63bb81fe1cbe27154efb874a210')

package() {
  _uuid='drop-down-terminal@gs-extensions.zzrough.org'

  install -d "${pkgdir}/usr/share/gnome-shell/extensions"
  install -d "${pkgdir}/usr/share/glib-2.0/schemas/"

  cd "${srcdir}/gs-extensions-drop-down-terminal-${pkgver}"
  mv "${_uuid}/org.zzrough.gs-extensions.drop-down-terminal.gschema.xml" \
    "${pkgdir}/usr/share/glib-2.0/schemas/"
  cp -af "${_uuid}" "${pkgdir}/usr/share/gnome-shell/extensions/"
}

# vim:set ts=2 sw=2 et:
