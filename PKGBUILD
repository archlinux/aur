# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cobang
pkgver=2.9.1
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
  'python-qrcode'
  'zbar'
)
makedepends=(
  'blueprint-compiler'
  'gobject-introspection'
  'meson'
)
source=("CoBang-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a5e7262cc3dfd8ba97f7a44620a7dc78480f22b1ac47fc92a6164f51c4a8ba97')

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
