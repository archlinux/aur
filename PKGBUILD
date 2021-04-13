# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=basis-universal
pkgver=1.15_rel2
pkgrel=1
pkgdesc="Basis Universal GPU Texture Codec"
arch=('x86_64')
url="https://github.com/BinomialLLC/basis_universal"
license=('Apache')
makedepends=('cmake' 'ninja')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('c7ada78211517176ac5d38850337500d132813e2c0af3bf338e66cac71ee5153')
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
