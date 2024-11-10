# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=razergenie
pkgver=1.2.0
pkgrel=1
pkgdesc="Configure and control your Razer devices"
arch=('x86_64')
url="https://github.com/z3ntu/RazerGenie"
license=('GPL-3.0-or-later')
depends=('libopenrazer' 'qt5-base' 'openrazer-daemon')
makedepends=('meson' 'qt5-tools')
source=("https://github.com/z3ntu/RazerGenie/releases/download/v$pkgver/RazerGenie-$pkgver.tar.xz"{,.asc})
sha512sums=('a026780c06c48b4bf91d7f59651a9b22a03079f112875aa6da5474d1bd348988612014906f498addc91912cbed9b070da981e3d58d925f5dbef185841542ae44'
            'SKIP')
validpgpkeys=('BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD') # Luca Weiss

build() {
  arch-meson "RazerGenie-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
