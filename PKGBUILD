# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cobang
pkgver=1.8.0
pkgrel=1
pkgdesc="A QR code scanner desktop app for Linux"
arch=('any')
url="https://github.com/hongquan/CoBang"
license=('GPL-3.0-or-later')
depends=(
  'adwaita-icon-theme'
  'gst-plugin-gtk4'
  'gst-plugins-good'
  'gst-python'
  'gstreamer'
  'gtk4'
  'libadwaita'
  'libndp'
  'libnm'
  'libportal'
  'libportal-gtk4'
  'libpwquality'
  'polkit'
  'python-gobject'
  'python-logbook'
  'python-pillow'
  'zbar'
)
makedepends=(
  'blueprint-compiler'
  'gobject-introspection'
  'meson'
)
source=("CoBang-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ec85c93ce0a1135df154e6202106427245b0205c46b90ff5c36be54948428404')

build() {
  arch-meson "CoBang-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
