# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=tiledb
_pkgname=TileDB
pkgver=2.7.0
pkgrel=1
pkgdesc="The Universal Storage Engine"
arch=('x86_64')
url="https://tiledb.com/"
license=('MIT')
makedepends=('make')
depends=('gcc' 'cmake' 'lz4' 'bzip2' 'zstd' 'zlib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TileDB-Inc/TileDB/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('97ec5235d4b277b47d76c1a0a567840d03e9d51d92682e98d649c9a7dd88d5ab')

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
