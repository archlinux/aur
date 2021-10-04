# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=rpclib
pkgver=2.3.0
pkgrel=1
pkgdesc="rpclib is a modern C++ msgpack-RPC server and client library"
url="http://rpclib.net"
arch=(x86_64)
license=('MIT')
depends=(gcc)
makedepends=(cmake gcc)
source=("https://github.com/rpclib/rpclib/archive/v$pkgver.tar.gz")
sha256sums=("eb9e6fa65e1a79b37097397f60599b93cb443d304fbc0447c50851bc3452fdef")

build() {
  mkdir -p "$srcdir/${pkgname}-${pkgver}/build"
  cd "$srcdir/${pkgname}-${pkgver}/build"
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
        -DBUILD_SHARED_LIBS=ON \
        ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESDIR=${pkgdir} install
}
