# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=basis-universal
pkgver=1.16.3
pkgrel=1
pkgdesc="Basis Universal GPU Texture Codec"
arch=('x86_64')
url="https://github.com/BinomialLLC/basis_universal"
license=('Apache')
makedepends=('cmake' 'ninja')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('b89563aa5879eed20f56b9cfa03b52848e759531fd5a1d51a8f63c846f96c2ac')
provides=(basisu)

prepare() {
  cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    basis_universal-$pkgver
}

build() {
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja install
}
