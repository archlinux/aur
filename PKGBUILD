# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mingle
pkgver=0.15
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
sha256sums=('deb96f228449be55de31d60fc2ac4095bdc798f7d4e7999a26872c3fb52fbf53')

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
