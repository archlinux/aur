# Maintainer: Alejandro Valdes <alejandrovaldes at live dot com>

_pkgname=plasma5-applets-latte-sidebar-button
pkgname=${_pkgname}-git
provides=(${_pkgname})
conflicts=(${_pkgname})
pkgver=0.1.0.r1.gd6fcf1e
pkgrel=1
pkgdesc="Plasma applet to show and hide Latte Sidebars"
arch=(any)
url='https://github.com/psifidotos/applet-latte-sidebar-button'
license=(GPLv2)
depends=(latte-dock plasma-workspace)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/applet-latte-sidebar-button
  git describe --long --tags | sed 's/^[v-]//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/applet-latte-sidebar-button"
  _pkgdir="$pkgdir/usr/share/plasma/plasmoids/org.kde.latte.sidebarbutton"
  install -Dm644 metadata.desktop -t "$_pkgdir"
  find contents/ -type f -exec install -Dm644 "{}" "$_pkgdir/{}" \;
}
