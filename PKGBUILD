# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=libversion
pkgver=3.0.4
pkgrel=1
pkgdesc='Advanced version string comparison library'
url='https://github.com/repology/libversion'
license=('MIT')
arch=('x86_64' 'i686')
depends=('gcc-libs')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/repology/libversion/archive/${pkgver}.tar.gz")
sha256sums=('48c2a4a98b6f220dedd535979f1e9ab83f9bf869e06c0f5e7bb1be6d2e662fee')
b2sums=('181732c6694f120893df7ba619b032ea05cdd6c7e9098b8bf6f1558cc1a014eb0f33a1c4d0b7505dce5865670244413d4856e1c3d1cab2e3ef95549ef43bbba0')

build() {
  cmake -B build -S "libversion-${pkgver}" \
    -D CMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm0644 "libversion-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
