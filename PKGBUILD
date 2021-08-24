# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=tracks-player-git
_pkgname=Tracks
pkgver=0.6.0
pkgrel=1
pkgdesc="A simple audio player"
arch=('any')
url="https://codeberg.org/som/Tracks"
license=('GPL3')
depends=('gtk4' 'gdk-pixbuf2' 'gstreamer' 'gst-plugins-base' 'glib2' 'gjs')
makedepends=('git' 'meson' 'gobject-introspection')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
sha256sums=('SKIP')

build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}


