# Original Author: Maxim Andersson <thesilentboatman@gmail.com>
# Current Maintainer: Jugal Gala <jugal.gala@sakec.ac.in>

pkgname=gnome-shell-extension-topicons-plus
pkgver=22
pkgrel=1
pkgdesc="Moves legacy tray icons to the top panel"
arch=('any')
url="https://github.com/phocean/TopIcons-plus"
license=('GPL2')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/phocean/TopIcons-plus/archive/v${pkgver}.tar.gz")
sha256sums=('4a666b462c22b67398813c689ff58ee7b6056f5121293abe32b898e9ea469697')

package() {
  _uuid='TopIcons@phocean.net'
  
  cd "${srcdir}/TopIcons-plus-${pkgver}"

  install -d "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
  install -Dm644 "schemas/org.gnome.shell.extensions.topicons.gschema.xml" \
    -t "${pkgdir}/usr/share/glib-2.0/schemas/"

  cp -af * "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
}

# vim:set ts=2 sw=2 et:
