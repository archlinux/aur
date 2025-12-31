# Contributor: Po-An, Yang (Antonio Yang) <yanganto at gmail.com>
# Contributor: tee < teeaur at duck dot com >
pkgname=wasmedge
pkgver=0.16.0
pkgrel=1
pkgdesc='WasmEdge is a lightweight, high-performance, and extensible WebAssembly runtime'
arch=('any')
url='https://wasmedge.org'
license=('Apache-2.0')
depends=('cmake' 'boost' 'openssl' 'ninja' 'rapidjson')
#source=("https://github.com/WasmEdge/WasmEdge/archive/${pkgver}.tar.gz")
source=("https://github.com/WasmEdge/WasmEdge/releases/download/$pkgver/WasmEdge-$pkgver-src.tar.gz")
sha256sums=('6a12152c1d7fd27e4f4fb6486c63e4c2f2663bb0c6be0edb287ef5796ed32610')

package() {
  install -d "${pkgdir}/usr"
  cd "${srcdir}/wasmedge"
  cmake -Bbuild -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" .
  cmake --build build
  ninja -C build install
}
