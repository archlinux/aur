# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=gnome-shell-extension-dynamic-top-bar-git
_gitname=GnomeShell_DynamicTopBar
pkgver=3.0.r1.gce58fc3
pkgrel=1
pkgdesc="Extension that make the top bar transparent when no window is maximized"
arch=('any')
url="https://github.com/AMDG2/GnomeShell_DynamicTopBar"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
conflicts=('gnome-shell-extension-dynamic-top-bar')
install=${pkgname}.install
source=('git://github.com/AMDG2/GnomeShell_DynamicTopBar.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  _uuid='dynamicTopBar@gnomeshell.feildel.fr'

  install -d "${pkgdir}/usr/share/gnome-shell/extensions"
  install -d "${pkgdir}/usr/share/glib-2.0/schemas/"

  cd "${srcdir}/${_gitname}"
  mv "${_uuid}/schemas/org.gnome.shell.extensions.dynamic-top-bar.gschema.xml" \
    "${pkgdir}/usr/share/glib-2.0/schemas/"
  cp -af "${_uuid}" "${pkgdir}/usr/share/gnome-shell/extensions/"

}

# vim:set ts=2 sw=2 et:
