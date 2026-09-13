# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=webarchive
pkgver=1.2.2
pkgrel=1
pkgdesc="Browse offline ZIM archives"
arch=('any')
url="https://github.com/mhhemati0/WebArchive"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'python-gobject'
  'python-libzim'
  'webkitgtk-6.0'
)
makedepends=('meson')
source=("WebArchive-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4178d6b926344bf7c34be33c2436347b73101b0a436f451ea122abb560473283')

build() {
  arch-meson "WebArchive-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
