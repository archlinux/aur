# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=basis-universal
pkgver=1.13
pkgrel=1
pkgdesc="Basis Universal GPU Texture Codec"
arch=('x86_64')
url="https://github.com/BinomialLLC/basis_universal"
license=('Apache')
makedepends=('cmake' 'ninja')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('f2aa3b8c46474a29c491284665ee9600937edb88dc3a4da474a2bc6c7148260c')
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
