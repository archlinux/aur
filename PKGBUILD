# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gnome-kiosk
pkgver=49.0
pkgrel=1
pkgdesc='Provides a desktop enviroment suitable for fixed purpose, or single application deployments like wall displays and point-of-sale systems'
arch=(x86_64)
url='https://gitlab.gnome.org/GNOME/gnome-kiosk'
license=(GPL-2.0-or-later)
depends=(
  bash
  cairo
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gnome-desktop-4
  gnome-session
  gsettings-desktop-schemas
  libglvnd
  libibus
  mutter
  systemd-libs
)
makedepends=(
  git
  glib2-devel
  meson
)
source=("git+https://gitlab.gnome.org/GNOME/gnome-kiosk.git#tag=$pkgver")
b2sums=(82db96d15d572eed766097b0835df7262bd1c886771480519100a000df952b3a59246c0aaa41c1a2e047ee81d8eca6bae70c6b22e5c5136bc5211bca28e56f8d)

build() {
  arch-meson $pkgname build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
