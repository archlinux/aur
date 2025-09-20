# Maintainer: Aleksey Smirnov <debugger94 at gmail dot com>

pkgname=gst-video-thumbnailer
pkgver=0.1
pkgrel=2
pkgdesc="A simple gstreamer thumbnailer written in Rust"
arch=(x86_64)
url="https://gitlab.gnome.org/sophie-h/$pkgname"
license=('GPL-3.0-or-later')
depends=(
  glib2
  gstreamer
)
makedepends=(
  git
  meson
  rust
)
conflicts=(gstreamer-thumbnailer)
replaces=(gstreamer-thumbnailer)
source=(git+$url.git)
sha256sums=('SKIP')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir" --no-rebuild
}
