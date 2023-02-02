# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=libversion
pkgver=3.0.3
pkgrel=1
pkgdesc='Advanced version string comparison library'
url='https://github.com/repology/libversion'
license=('MIT')
arch=('x86_64' 'i686')
depends=('gcc-libs')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/repology/libversion/archive/${pkgver}.tar.gz")
sha256sums=('bb49d745a0c8e692007af6d928046d1ab6b9189f8dbba834cdf3c1d251c94a1d')
b2sums=('00d4a9a6aefb3f2a6495538356b0fad631a71b410a4b98ebebfc95e6b7772c4803edf127dac5007fd31d2351082a44099c168920fb06a0b9da3d83db9ab7c481')

build() {
  cmake -B build -S "libversion-${pkgver}" \
    -D CMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm0644 "libversion-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
