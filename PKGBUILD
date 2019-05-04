pkgname=plasma-hud-git
pkgver=18.12.0.r8.g77b23d4
pkgrel=2
pkgdesc="Provides a way to run menubar commands through rofi, much like the Unity 7 Heads-Up Display (HUD)."
arch=(x86_64)
url="https://github.com/Zren/plasma-hud"
license=(GPL)
depends=(plasma-workspace rofi python python-dbus python-setproctitle python-xlib gobject-introspection appmenu-gtk-module python-gobject)
makedepends=(git)
source=("git+${url}.git")
sha256sums=('SKIP')
install=${pkgname}.install

pkgver() {
  cd plasma-hud
  git describe --long --tags | sed 's/^[v-]//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  _pkgdir="$pkgdir/usr/lib/plasma-hud"
  mkdir -p $_pkgdir
  cp -r plasma-hud/usr/lib/plasma-hud/* "$_pkgdir"
  mkdir -p "$pkgdir/etc/xdg/autostart"
  cp plasma-hud/etc/xdg/autostart/* "$pkgdir/etc/xdg/autostart"
}
