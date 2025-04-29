# Maintainer: Luca Weiss <aur (at) lucaweiss (dot) eu>

pkgname=libopenrazer
pkgver=0.4.0
pkgrel=1
pkgdesc="Qt wrapper around the D-Bus API from OpenRazer"
arch=('x86_64')
url="https://github.com/z3ntu/libopenrazer"
license=('GPL-3.0-or-later')
depends=('qt6-base')
makedepends=('meson' 'qt6-tools')
source=("https://github.com/z3ntu/libopenrazer/releases/download/v$pkgver/libopenrazer-$pkgver.tar.xz"{,.asc})
sha512sums=('336b6659ad3931513e38230a69bd36bf7f0f693e7888a1c9955f06710398fd6cb7eeb6124ad6b69d50c353c39038f2e0ee40b747508514451ba516a592e2c545'
            'SKIP')
validpgpkeys=('BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD') # Luca Weiss

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
