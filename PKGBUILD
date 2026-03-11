# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cobang
pkgver=2.5.0
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
sha256sums=('1bd2f7ec6ba31b9b257620711d57496858bef6fefcdf517dce3b8e414352b6a2')

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
