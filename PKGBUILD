# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=basis-universal
pkgver=1.16.4
pkgrel=1
pkgdesc="Basis Universal GPU Texture Codec"
arch=('x86_64')
url="https://github.com/BinomialLLC/basis_universal"
license=('Apache')
makedepends=('cmake' 'ninja')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('e5740fd623a2f8472c9700b9447a8725a6f27d65b0b47c3e3926a60db41b8a64')
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
