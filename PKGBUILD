# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mingle
pkgver=0.16
pkgrel=1
pkgdesc="A simple GTK4-Libadwaita app to play with Google's Emoji Kitchen."
arch=('x86_64')
url="https://github.com/halfmexican/mingle"
license=('GPL-3.0-or-later')
depends=(
  'libadwaita'
  'libgee'
)
makedepends=(
  'blueprint-compiler'
  'meson'
  'vala'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1e5490cacc7f08d160ad6b4851ea3d15a230ca411e2e8e90bc83e09a03e3a2cd')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
