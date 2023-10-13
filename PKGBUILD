# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=libopenrazer
pkgver=0.2.0
pkgrel=1
pkgdesc="Qt wrapper around the D-Bus API from OpenRazer"
arch=('x86_64')
url="https://github.com/z3ntu/libopenrazer"
license=('GPL3')
depends=('qt5-base')
makedepends=('meson' 'qt5-tools')
source=("https://github.com/z3ntu/libopenrazer/releases/download/v$pkgver/libopenrazer-$pkgver.tar.xz"{,.asc})
sha512sums=('2adc4f91a719aed1b4aea820f25185aef16d01f1fc73a9453cadd1a7f9b505708f2d2f54b19e9aa83a9544b43f17437ddf54e84f08219e07643f88c07d65dd3b'
            'SKIP')
validpgpkeys=('BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD') # Luca Weiss

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
