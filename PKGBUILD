# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=gnome-shell-extension-topicons-plus
pkgver=17
pkgrel=1
pkgdesc="Moves legacy tray icons to the top panel"
arch=('any')
url="https://github.com/phocean/TopIcons-plus"
license=('GPL2')
depends=('gnome-shell')
install=${pkgname}.install
source=("https://github.com/phocean/TopIcons-plus/archive/v${pkgver}.tar.gz")
sha256sums=('7603b5c03c9082cae660e2ddc6e14c2321321a5ae536466fb515a78c38aef3d9')

package() {
  _uuid='TopIcons@phocean.net'
  
  cd "${srcdir}/TopIcons-plus-${pkgver}"

  install -d "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
  install -Dm644 "schemas/org.gnome.shell.extensions.topicons.gschema.xml" \
    -t "${pkgdir}/usr/share/glib-2.0/schemas/"

  cp -af * "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
}

# vim:set ts=2 sw=2 et:
