# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=gnome-shell-extension-dynamic-top-bar
pkgver=3.3.1
pkgrel=1
pkgdesc="Extension that make the top bar transparent when no window is maximized"
arch=('any')
url="https://github.com/AMDG2/GnomeShell_DynamicTopBar"
license=('GPL3')
depends=('gnome-shell')
install=${pkgname}.install
source=("https://github.com/AMDG2/GnomeShell_DynamicTopBar/archive/${pkgver}.tar.gz")
sha256sums=('15a6069b8d6799d946291aeaf7375e9d3077ac82bf1bfb83af59055a7c2bfe6d')

package() {
  _uuid='dynamicTopBar@gnomeshell.feildel.fr'

  install -d "${pkgdir}/usr/share/gnome-shell/extensions"
  install -d "${pkgdir}/usr/share/glib-2.0/schemas/"

  cd "${srcdir}/GnomeShell_DynamicTopBar-${pkgver}"
  mv "${_uuid}/schemas/org.gnome.shell.extensions.dynamic-top-bar.gschema.xml" \
    "${pkgdir}/usr/share/glib-2.0/schemas/"
  cp -af "${_uuid}" "${pkgdir}/usr/share/gnome-shell/extensions/"
}

# vim:set ts=2 sw=2 et:
