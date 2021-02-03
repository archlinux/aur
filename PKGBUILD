# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=libversion
pkgver=3.0.1
pkgrel=1
pkgdesc='Advanced version string comparison library'
url='https://github.com/repology/libversion'
license=('MIT')
arch=('x86_64' 'i686')
depends=('gcc-libs')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/repology/libversion/archive/${pkgver}.tar.gz")
sha256sums=('2b4ac5a6aa84a6b1795d9194c260517b709c9723d020ca61d9030ad2cfd7ea57')
b2sums=('d65f4d415e5c17abf49b641bb7ecee08ccd07c747bfddb43c6d0586a6d48bbb4e87b607f0812abb3da7c5696e928c79ebd1c0a00d7baaf5be75caffe7b18a2e7')

build() {
  cmake -B build -S "libversion-${pkgver}" \
    -D CMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm0644 "libversion-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
