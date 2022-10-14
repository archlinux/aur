# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=libversion
pkgver=3.0.2
pkgrel=1
pkgdesc='Advanced version string comparison library'
url='https://github.com/repology/libversion'
license=('MIT')
arch=('x86_64' 'i686')
depends=('gcc-libs')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/repology/libversion/archive/${pkgver}.tar.gz")
sha256sums=('14776f2ea2e7e8883641fd18416d25a75860afe46397130b6d52290420856600')
b2sums=('e345aea49dd9968ab2a39e4c8544b5be3249026eea0816f5da46cd1ad4a7f8ccf71566293befe8cfe58f55cac3534c8b8483f4e7ce9dd87bb40c0fab54ef0f2e')

build() {
  cmake -B build -S "libversion-${pkgver}" \
    -D CMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm0644 "libversion-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
