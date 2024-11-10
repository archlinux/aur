# Maintainer: Luca Weiss <aur (at) lucaweiss (dot) eu>

pkgname=libopenrazer
pkgver=0.3.0
pkgrel=1
pkgdesc="Qt wrapper around the D-Bus API from OpenRazer"
arch=('x86_64')
url="https://github.com/z3ntu/libopenrazer"
license=('GPL-3.0-or-later')
depends=('qt5-base')
makedepends=('meson' 'qt5-tools')
source=("https://github.com/z3ntu/libopenrazer/releases/download/v$pkgver/libopenrazer-$pkgver.tar.xz"{,.asc})
sha512sums=('4980bf5fe86936840aedf506e9a3e4eac7df15b979dcc4036bf47edad027a4c6ad3b8b2ec5e51d9e8832d2ecaa74e89c5991984a50305162aadcfae3d9be8fae'
            'SKIP')
validpgpkeys=('BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD') # Luca Weiss

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
