# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=tiledb
_pkgname=TileDB
pkgver=2.8.1
pkgrel=1
pkgdesc="The Universal Storage Engine"
arch=('x86_64')
url="https://tiledb.com/"
license=('MIT')
makedepends=('make')
depends=('gcc' 'cmake' 'lz4' 'bzip2' 'zstd' 'zlib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TileDB-Inc/TileDB/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ffb69528369065971a65bc416886d4d3b65b8af614e21403975bc3d033e873a5')

build() {
  ls
  cd "$_pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/local" \
  cmake .
  make -j "$(nproc)"
}

package() {
  cd "$_pkgname-$pkgver"
  make install
}
