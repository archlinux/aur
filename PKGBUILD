# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=libversion
pkgver=3.0.5
pkgrel=1
pkgdesc='Advanced version string comparison library'
url='https://github.com/repology/libversion'
license=('MIT')
arch=('x86_64' 'i686')
depends=('gcc-libs')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/repology/libversion/archive/${pkgver}.tar.gz")
sha256sums=('b2da53a5adc8189332dbdf9bddd4f7ce897bcefac3755d8bcaf2a9a620682acd')
b2sums=('f8c46c323000fdfc127b1973f028ba15aaaec630ce9d0f542e4497d61f95ade13bb3e41fa73e2ebeb6896abc8d91ced1771d3fe20456fa02821742f7d8f24ae5')

build() {
  cmake -B build -S "libversion-${pkgver}" \
    -D CMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm0644 "libversion-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
