# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=recastnavigation
pkgver=1.6.0
pkgrel=1
pkgdesc="Navigation-msh Toolset for Games"
url="https://github.com/recastnavigation/recastnavigation"
arch=(x86_64)
license=('Zlib')
makedepends=(cmake gcc sdl2 glut)
depends=(sdl2 glut)
source=("https://github.com/recastnavigation/recastnavigation/archive/v$pkgver.tar.gz")
sha256sums=("d48ca0121962fa0639502c0f56c4e3ae72f98e55d88727225444f500775c0074")

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
