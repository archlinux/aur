# Maintainer: j.r <j.r@jugendhacker.de>
# Contributor: Jugal Gala <jugal.gala@sakec.ac.in>
# Contributor: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=gnome-shell-extension-topicons-plus
pkgver=27
pkgrel=2
pkgdesc="Moves legacy tray icons to the top panel"
arch=('any')
url="https://github.com/phocean/TopIcons-plus"
license=('GPL2')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/phocean/TopIcons-plus/archive/${pkgver}.tar.gz")
sha256sums=('51c94aa52dd19e9f3740fee9580e47961414d7aec63dd588cb9c067cef8f4ad8')

build(){
  cd "${srcdir}/TopIcons-plus-${pkgver}"

  make build
}

package() {
  cd "${srcdir}/TopIcons-plus-${pkgver}"

  make install INSTALL_PATH=${pkgdir}/usr/share/gnome-shell/extensions

  install -Dm644 "schemas/org.gnome.shell.extensions.topicons.gschema.xml" \
    -t "${pkgdir}/usr/share/glib-2.0/schemas/"
}

# vim:set ts=2 sw=2 et:
