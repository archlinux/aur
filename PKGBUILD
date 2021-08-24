# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=tracks-player
_pkgname=tracks
pkgver=0.6.0
pkgrel=1
pkgdesc="A simple audio player"
arch=('any')
url="https://codeberg.org/som/Tracks"
license=('GPL3')
depends=('gtk4' 'gdk-pixbuf2' 'gstreamer' 'gst-plugins-base' 'glib2' 'gjs')
makedepends=('meson' 'gobject-introspection')
checkdepends=('appstream-glib')
source=(https://codeberg.org/som/Tracks/archive/v0.6.0.tar.gz)
sha256sums=('d1bc50ef25b0a48b2ee8488f2107e3d12f7ec7d33f6dc1a15e0de797dbf403b6')

build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}


