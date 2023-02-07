# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=alacenc
pkgver=0.3.0
pkgrel=1
pkgdesc="Encode audio into the Apple Lossless Audio Codec (ALAC) format. (Git Version)"
arch=(x86_64)
url="https://github.com/flacon/alacenc"
license=(MIT)
depends=(gcc-libs)
makedepends=(git cmake)
source=("git+https://github.com/flacon/alacenc.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cmake -S alacenc -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 alacenc/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
