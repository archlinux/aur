# Maintainer: Aleksey Smirnov <debugger94 at gmail dot com>

pkgname=gst-thumbnailers
pkgver=0.1
pkgrel=2
_commit=a169c0e3084347646679c21e434ccb0dced582e3
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
conflicts=(gstreamer-thumbnailer gst-video-thumbnailer)
replaces=(gstreamer-thumbnailer gst-video-thumbnailer)
source=(git+$url.git#commit=$_commit)
sha256sums=('c95d33fd1bbb1846d040bfcd782893dec3cf9c8d1d43a886df194fe1593d736e')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir" --no-rebuild
}
