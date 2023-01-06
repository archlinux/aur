# Maintainer: Lucy Ekatarina <lucy@dragnof.pro>
pkgname=sdl_gpu
pkgver=0.12.0
pkgrel=2
pkgdesc="A library for making hardware-accelerated 2D graphics easy"
arch=('x86_64')
url="https://github.com/grimfang4/sdl-gpu"
license=('MIT')
depends=('sdl2' 'mesa')
makedepends=('cmake' 'ninja')
source=("https://github.com/grimfang4/sdl-gpu/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("55b23661dec145c4f2c8d44ca6d0dabfc53803fef09668c69b6ea9af6693b1604e25107f1e42f1b75550365734f4c4c25c8a2dc9912fda4f18b1db459575ff80")

build() {
  cmake -S sdl-gpu-${pkgver} -G "Ninja" -D CMAKE_INSTALL_PREFIX=/usr
  cmake --build .
}

package() {
  DESTDIR="${pkgdir}" cmake --install .

  install -Dm644 sdl-gpu-${pkgver}/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

