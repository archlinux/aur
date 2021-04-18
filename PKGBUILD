# Maintainer: tinywrkb <tinywrkb@gmail.com>

pkgname=gsettings-xsettings-schemas
pkgver=40.0
pkgrel=3
pkgdesc='Workaround for font rendering issues in Wayland clients, GSettings schema of the XSETTINGS plugin from GNOME Settings Daemon'
arch=(any)
url='https://gitlab.gnome.org/GNOME/gnome-settings-daemon'
license=(GPL)
install=${pkgname}.install
depends=(gsettings-desktop-schemas)
conflicts=(gnome-settings-daemon)
source=(org.gnome.settings-daemon.enums.xml
        org.gnome.settings-daemon.plugins.xsettings.gschema.xml)
sha256sums=('d738f99c2d49055bfe2d0aee8eee798b36c1514a423237eee7b95b63973b7c4c'
            'cfc1e37bf6847788427fb3e9e1b6f310b0a81a13a7d2ce3c934ed6eaf3eafb67')

package() {
  install -Dm644 org.gnome.settings-daemon.*.xml -t "${pkgdir}"/usr/share/glib-2.0/schemas/
}
