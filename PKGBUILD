# Maintainer: robertfoster
pkgname=piper-phonemize
pkgver=2023.11.14
_rel=4
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

sha256sums=('4713d62b9d639d9e27c9abb6dcc5f98ee36c9b873ae0590644d325837ebf135a')
