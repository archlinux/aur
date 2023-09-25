# Maintainer: Sebastien MacDougall-Landry

pkgname=tidal2d
pkgver=0.3
pkgrel=1
pkgdesc='Simple game engine'
url='https://github.com/EmperorPenguin18/tidal2d/'
source=("https://github.com/EmperorPenguin18/$pkgname/archive/$pkgver.tar.gz")
arch=('x86_64')
license=('LGPL3')
depends=('sdl2' 'chipmunk' 'stb' 'nanosvg' 'lua')
optdepends=('openssl' 'emscripten')
makedepends=('cmake')
sha256sums=('d9ac19918d568d08065d26df8864ee702163ee0be6d89507a3fc7fec31105bbd')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=$pkgdir/usr -DCMAKE_BUILD_TYPE=Release
  cmake --build .
}

package () {
  cd "$srcdir/$pkgname-$pkgver"
  cd build
  cmake --build . --target install
}
