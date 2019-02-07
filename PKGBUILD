# Maintainer: Claudio Cocciarelli <claudiococciarelli at gmail dot com>

pkgname=mutter-dev
_pkgname=mutter
pkgver=3.31.90
pkgrel=2
pkgdesc="A window manager for GNOME."
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL)
depends=(dconf gobject-introspection-runtime gsettings-desktop-schemas-dev libcanberra
         startup-notification zenity libsm gnome-desktop upower libxkbcommon-x11
         gnome-settings-daemon libgudev libinput pipewire)
makedepends=(intltool gobject-introspection git egl-wayland)
provides=(mutter)
conflicts=(mutter)
groups=(gnome)
source=("git+https://gitlab.gnome.org/GNOME/mutter.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson "$_pkgname" build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
