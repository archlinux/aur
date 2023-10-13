# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=razergenie
pkgver=1.1.0
pkgrel=1
pkgdesc="Configure and control your Razer devices"
arch=('x86_64')
url="https://github.com/z3ntu/RazerGenie"
license=('GPL3')
depends=('libopenrazer' 'qt5-base' 'openrazer-daemon')
makedepends=('meson' 'qt5-tools')
source=("https://github.com/z3ntu/RazerGenie/releases/download/v$pkgver/RazerGenie-$pkgver.tar.xz"{,.asc})
sha512sums=('3deaffedeccbc9bb086cb7d3ff531c8a546ae1b973bc7285a1071be048ec0d7ab8c82738ffcd0cb1eb925607ed015a83ffecde524ffeb82b0c60d8d1f520718c'
            'SKIP')
validpgpkeys=('BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD') # Luca Weiss

build() {
  arch-meson "RazerGenie-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
