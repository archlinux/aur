# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cine
pkgver=1.8.6
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
sha256sums=('49a450940d52f7cf2f341aa5296081bf1b549b35e89beed399c93277b2002778')

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
