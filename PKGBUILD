# Maintainer: robertfoster
pkgname=piper-phonemize
pkgver=2023.9.27
_rel=2
pkgrel=1
pkgdesc="C++ library for converting text to phonemes for Piper."
arch=('aarch64' 'x86_64')
url="https://github.com/rhasspy/piper-phonemize"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
conflicts=('espeak-ng' 'onnxruntime')
provides=('onnxruntime')
source=("${pkgname}.tar.gz::${url}/archive/refs/tags/${pkgver}-${_rel}.tar.gz")

build() {
  cmake -S "${pkgname}-${pkgver}-${_rel}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -Bbuild

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" \
    cmake --install build
}

sha256sums=('f868f2dd926791563fa47858abdfc7c630845b7d57d91b28bcbadd7f3fa6ea38')
