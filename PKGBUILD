# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=protonplus
pkgver=0.6.1
pkgrel=1
pkgdesc="A modern compatibility tools manager"
arch=('x86_64')
url="https://github.com/Vysp3r/ProtonPlus"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'json-glib'
  'libadwaita'
  'libarchive'
  'libgee'
  'libnotify'
  'libsoup3'
  'sdl3'
)
makedepends=(
  'meson'
  'vala'
)
optdepends=(
  'gamemode'
  'gamescope'
  'mangohud'
  'protontricks'
  'scopebuddy'
)
source=("$pkgname-$pkgver-1.tar.gz::$url/archive/refs/tags/v$pkgver-1.tar.gz")
sha256sums=('7eb9ccd29a17cd482ed9e12a3d3e95bf5c8ae0574acf1c5fefb84829f1148eca')

build() {
  arch-meson "ProtonPlus-$pkgver-1" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
