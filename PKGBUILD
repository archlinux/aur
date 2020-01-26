# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=rpclib
pkgver=2.2.1
pkgrel=1
pkgdesc="rpclib is a modern C++ msgpack-RPC server and client library"
url="http://rpclib.net"
arch=(x86_64)
license=('MIT')
depends=(gcc)
makedepends=(cmake gcc)
source=("https://github.com/rpclib/rpclib/archive/v$pkgver.tar.gz")
sha256sums=("ceef2c521a1712035bc64d1bd5e3b2c7de16a1d856cbbeadd000ae318c96463f")

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
