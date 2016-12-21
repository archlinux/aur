# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=gnome-shell-extension-topicons-plus
pkgver=18
pkgrel=1
pkgdesc="Moves legacy tray icons to the top panel"
arch=('any')
url="https://github.com/phocean/TopIcons-plus"
license=('GPL2')
depends=('gnome-shell')
install=${pkgname}.install
source=("https://github.com/phocean/TopIcons-plus/archive/v${pkgver}.tar.gz")
sha256sums=('99210314a138d3cc8fb756b8b67f9729bf460d9b84ac7d86d4ab5f8f6839da2d')

package() {
  _uuid='TopIcons@phocean.net'
  
  cd "${srcdir}/TopIcons-plus-${pkgver}"

  install -d "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
  install -Dm644 "schemas/org.gnome.shell.extensions.topicons.gschema.xml" \
    -t "${pkgdir}/usr/share/glib-2.0/schemas/"

  cp -af * "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
}

# vim:set ts=2 sw=2 et:
