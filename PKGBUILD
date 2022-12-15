# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=libopenrazer
pkgver=0.1.0
pkgrel=1
pkgdesc="Qt wrapper around the D-Bus API from OpenRazer"
arch=('x86_64')
url="https://github.com/z3ntu/libopenrazer"
license=('GPL3')
depends=('qt5-base')
makedepends=('meson' 'qt5-tools')
source=("https://github.com/z3ntu/libopenrazer/releases/download/v$pkgver/libopenrazer-$pkgver.tar.xz"{,.asc})
sha512sums=('ed9ca27c007ca6a03786edd72fd8df84c37ff66940f583bf03a5b593910f9bcfe4fbe0ba14ef932e5fc22b94c3e95005b419ee52b178375050fc11790f70e320'
            'SKIP')
validpgpkeys=('BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD') # Luca Weiss

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
