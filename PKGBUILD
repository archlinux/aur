# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=gnome-shell-extension-drop-down-terminal
pkgver=19
pkgrel=1
pkgdesc="Drop Down Terminal extension for the Gnome Shell"
arch=('any')
url="https://github.com/zzrough/gs-extensions-drop-down-terminal"
license=('GPL3')
depends=('gnome-shell')
install=${pkgname}.install
source=("https://github.com/zzrough/gs-extensions-drop-down-terminal/archive/v${pkgver}.tar.gz")
sha256sums=('1e50ad81ba731e4273e93bc2773d969056bf5cf7d1ccea78fd8fa093511aeede')

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
