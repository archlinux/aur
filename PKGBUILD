# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=qdldl
pkgver=0.1.5
pkgrel=1
pkgdesc="A free LDL factorisation routine"
url="https://github.com/oxfordcontrol/qdldl"
arch=(x86_64)
license=('Apache-2.0')
makedepends=(cmake gcc)
depends=()
source=("https://github.com/oxfordcontrol/qdldl/archive/v$pkgver.tar.gz")
sha256sums=("2868b0e61b7424174e9adef3cb87478329f8ab2075211ef28fe477f29e0e5c99")

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
