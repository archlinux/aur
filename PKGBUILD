# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=buoh
pkgver=0.8.2
pkgrel=15
pkgdesc='Online strips comics reader for GNOME'
arch=(x86_64)
url='http://buoh.steve-o.org/'
license=(GPL-2.0-or-later)
depends=(
  dconf
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libsoup
  libxml2
)
makedepends=(
  git
  glib2-devel
  meson
)
source=(git+https://gitlab.gnome.org/GNOME/buoh.git)
b2sums=(SKIP)

build() {
  arch-meson $pkgname build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
