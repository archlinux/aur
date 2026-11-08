# Maintainer: Ante Laurijssen <va2bbw@gmail.com>

pkgname=mailviewer
pkgver=1.0.17
pkgrel=1
pkgdesc="EML & MSG mail viewer for GNOME written in Rust"
arch=('x86_64')
url="https://github.com/alescdb/mailviewer"
license=('GPL-3.0-or-later')
depends=(
  'gcc-libs'
  'glib2'
  'glibc'
  'gmime3'
  'gtk4'
  'hicolor-icon-theme'
  'libadwaita'
  'webkitgtk-6.0'
)
makedepends=(
  'blueprint-compiler'
  'cargo'
  'gettext'
  'glib2-devel'
  'meson'
)
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b4f1ddd90ff1508bc304e15bb80d44b69e1e9e7b88ac2cf329dfe30263cf498e')

build() {
  arch-meson "$pkgname-$pkgver" build --buildtype=release
  meson compile -C build
}
package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
