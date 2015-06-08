# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=gnome-shell-extension-drop-down-terminal
pkgver=17
pkgrel=1
pkgdesc="Drop Down Terminal extension for the Gnome Shell"
arch=('any')
url="https://github.com/zzrough/gs-extensions-drop-down-terminal"
license=('GPL3')
depends=('gnome-shell')
install=${pkgname}.install
source=("https://github.com/zzrough/gs-extensions-drop-down-terminal/archive/v${pkgver}.tar.gz")
sha256sums=('769096291d2fd3240c216288f43827947a442a2c6d1cbc6e165bbfb17b08af79')

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
