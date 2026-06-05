# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cine
pkgver=1.5.1
pkgrel=1
pkgdesc="Video Player for Linux"
arch=('any')
url="https://github.com/diegopvlk/Cine"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'mpv'
  'python-gobject'
  'python-mpv'
)
makedepends=(
  'blueprint-compiler'
  'meson'
)
source=("Cine-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8b63885be793d761c3c224406a265017849effb2e3fc82d3dc61eaf9821c64f7')

build() {
  arch-meson "Cine-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
