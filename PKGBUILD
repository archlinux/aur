# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=tiledb
_pkgname=TileDB
pkgver=2.6.2
pkgrel=1
pkgdesc="The Universal Storage Engine"
arch=('x86_64')
url="https://tiledb.com/"
license=('MIT')
makedepends=('make')
depends=('gcc' 'cmake' 'lz4' 'bzip2' 'zstd' 'zlib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TileDB-Inc/TileDB/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6974dd4e53edabda75cc8fa6b5772c71d6adb3eaafa76397e0542b3606f6f783')

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
