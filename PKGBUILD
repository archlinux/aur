# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=razergenie
pkgver=1.0.0
pkgrel=1
pkgdesc="Configure and control your Razer devices"
arch=('x86_64')
url="https://github.com/z3ntu/RazerGenie"
license=('GPL3')
depends=('libopenrazer' 'qt5-base' 'openrazer-daemon')
makedepends=('meson' 'qt5-tools')
source=("https://github.com/z3ntu/RazerGenie/releases/download/v$pkgver/RazerGenie-$pkgver.tar.xz"{,.asc})
sha512sums=('a81f34dc75d6273db7f5eaa2d38eb79840d8369586c75e9e9b1a2e41eafd17e789a078f07c88dd13bf1d1380f4fbb483cd4ad61fae911f22a06dbe757c9b13c9'
            'SKIP')
validpgpkeys=('BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD') # Luca Weiss

build() {
  arch-meson "RazerGenie-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
