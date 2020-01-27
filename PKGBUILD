# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=qdldl
pkgver=0.1.4
pkgrel=1
pkgdesc="A free LDL factorisation routine"
url="https://github.com/oxfordcontrol/qdldl"
arch=(x86_64)
license=('Apache-2.0')
makedepends=(cmake gcc)
depends=()
source=("https://github.com/oxfordcontrol/qdldl/archive/v$pkgver.tar.gz")
sha256sums=("4eaed3b2d66d051cea0a57b0f80a81fc04ec72c8a906f8020b2b07e31d3b549c")

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
