# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=basis-universal
pkgver=1.08
pkgrel=1
pkgdesc="Basis Universal GPU Texture Codec"
arch=('x86_64')
url="https://github.com/BinomialLLC/basis_universal"
license=('Apache')
makedepends=('cmake' 'ninja')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('2f9b09fcb0598599d34a2cca3572a93062e16b6659de554a310a25c775fa3efd')
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
