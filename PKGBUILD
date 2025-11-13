# Maintainer: Aleksey Smirnov <debugger94 at gmail dot com>

pkgname=gst-thumbnailers
pkgver=0.1
_commit=057b8836b449ddd3a08243c7b70746341e28a4d9
pkgrel=1
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
sha256sums=('0ab39df11d6859984ac661b6044ca5f75bcd3a39c72445d55d5833ed90bb3092')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir" --no-rebuild
}
