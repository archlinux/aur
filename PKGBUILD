# Maintainer: johnnybash <georgpfahler at wachenzell dot org>

pkgname=rhythmbox-plugin-hide-git
_pkgname=rhythmbox_hide
pkgver=14.8f48bb1
pkgrel=1
pkgdesc="enabled rhythmbox to start either hidden or minimized"
arch=("any")
url="https://github.com/fossfreedom/rhythmbox_hide"
license=("GPL3")
provides=("rhythmbox-hide")
depends=("rhythmbox")
source=("git+https://github.com/fossfreedom/rhythmbox_hide.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm644 rhythmbox_hide.plugin "${pkgdir}/usr/lib/rhythmbox/plugins/${_pkgname}/rhythmbox_hide.plugin"
  install -Dm644 rhythmbox_hide.py "${pkgdir}/usr/lib/rhythmbox/plugins/${_pkgname}/rhythmbox_hide.py"
  install -Dm644 schema/org.gnome.rhythmbox.plugins.rhythmbox_hide.gschema.xml "${pkgdir}/usr/share/glib-2.0/schemas/org.gnome.rhythmbox.plugins.rhythmbox_hide.gschema.xml"
}
