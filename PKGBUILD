# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=recastnavigation
pkgver=1.5.1
pkgrel=1
pkgdesc="Navigation-msh Toolset for Games"
url="https://github.com/recastnavigation/recastnavigation"
arch=(x86_64)
license=('Zlib')
makedepends=(cmake gcc sdl2 glut)
depends=(sdl2 glut)
source=("https://github.com/recastnavigation/recastnavigation/archive/$pkgver.tar.gz")
sha256sums=("fdd0d9ac656993cb34d02d3c6c41e3a3311c1da79b84bbedca71c5d629f915fc")

build() {
  mkdir -p "$srcdir/${pkgname}-${pkgver}/build"
  cd "$srcdir/${pkgname}-${pkgver}/build"
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
        ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESDIR=${pkgdir} install
}
