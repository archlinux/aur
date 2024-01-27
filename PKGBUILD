pkgname=clipper2
pkgver=1.3.0
pkgrel=1
pkgdesc="Polygon Clipping and Offsetting"
arch=('x86_64')
url="https://github.com/AngusJohnson/Clipper2"
license=('BSL-1.0')
depends=('glibc' 'gcc-libs')
source=("https://github.com/AngusJohnson/Clipper2/archive/refs/tags/Clipper2_${pkgver}.tar.gz")
sha256sums=('8e537ec320e140afaa8fba1f23120416693cc1d71b0f76ad801d24b88b5e0b3c')

build () {
  cd "$srcdir"/Clipper2-Clipper2_${pkgver}/CPP
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=ON -DCLIPPER2_TESTS=OFF -DCLIPPER2_EXAMPLES=OFF -DCLIPPER2_UTILS=OFF .
  make
}

package () {
  cd "$srcdir"/Clipper2-Clipper2_${pkgver}/CPP
  make install DESTDIR="$pkgdir"
}
