# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gnome-kiosk
pkgver=47.0
pkgrel=1
pkgdesc='Provides a desktop enviroment suitable for fixed purpose, or single application deployments like wall displays and point-of-sale systems'
arch=(x86_64)
url='https://gitlab.gnome.org/GNOME/gnome-kiosk'
license=(GPL-2.0-or-later)
depends=(
  bash
  gcc-libs
  glib2
  glibc
  gnome-desktop-4
  gnome-session
  gsettings-desktop-schemas
  libglvnd
  libibus
  libx11
  mutter
  systemd-libs
)
makedepends=(
  git
  glib2-devel
  meson
)
source=("git+https://gitlab.gnome.org/GNOME/gnome-kiosk.git#tag=$pkgver")
b2sums=(2c98777771de0e481a34bcc70971c03d17c945a1526ffff2edd6e9531b6f694d531124cf98c185ecbaa011956e4be45020e415ba9ae498fc526ccbfbed90bbb3)

build() {
  arch-meson $pkgname build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
