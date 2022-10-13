# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=cobang
pkgver=0.9.8
pkgrel=1
pkgdesc="A QR code scanner desktop app for Linux"
arch=('any')
url="https://github.com/hongquan/CoBang"
license=('GPL3')
depends=('gst-plugin-gtk' 'gst-plugins-good' 'gst-python' 'libhandy' 'libnm'
         'python-gobject' 'python-kiss-headers' 'python-logbook' 'python-pillow'
         'python-requests' 'python-single-version' 'zbar')
makedepends=('git' 'gobject-introspection' 'meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9316166852914d425014516f4086c763050f573a469439ea6bd10ab3ff73555c')

build() {
  arch-meson "CoBang-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
