# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=qdldl
pkgver=0.1.6
pkgrel=1
pkgdesc="A free LDL factorisation routine"
url="https://github.com/oxfordcontrol/qdldl"
arch=(x86_64)
license=('Apache-2.0')
makedepends=(cmake gcc)
depends=()
source=("https://github.com/oxfordcontrol/qdldl/archive/v$pkgver.tar.gz")
sha256sums=("aeb1b2d76849c13e9803760a4c2e26194bf80dcc9614ae25ca6bcc404dc70d65")

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
