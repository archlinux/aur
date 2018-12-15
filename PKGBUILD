pkgname=plasma-hud-git
pkgver=16.10.0.r90.g7ff3752
pkgrel=1
pkgdesk="Provides a way to run menubar commands through rofi, much like the Unity 7 Heads-Up Display (HUD)."
arch=(x86_64)
url="https://github.com/Zren/plasma-hud"
license=(GPL)
depends=(plasma-workspace rofi python python-dbus python-setproctitle python-xlib gobject-introspection appmenu-gtk-module appmenu-qt4)
makedepends=(git)
source=("git+${url}.git")
sha256sums=('SKIP')
install=${pkgname}.install

pkgver() {
  cd plasma-hud
  git describe --long | sed 's/^[v-]//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  _pkgdir="$pkgdir/usr/lib/plasma-hud"
  mkdir -p $_pkgdir
  cp -r plasma-hud/usr/lib/plasma-hud/* "$_pkgdir"
  mkdir -p "$pkgdir/etc/xdg/autostart"
  cp plasma-hud/etc/xdg/autostart/* "$pkgdir/etc/xdg/autostart"
}
