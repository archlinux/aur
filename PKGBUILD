# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
pkgname=ha
pkgver=0.999beta
pkgrel=1
epoch=
pkgdesc="HA is an archiver which Harri Hirvola released in January 1993 as version 0.98."
arch=('x86_64' 'i686')
url="https://github.com/pfactum/ha"
license=('GPL')
depends=('glibc')
makedepends=('gcc' 'cmake' 'make')

source=("${pkgname}-${pkgver}::git+https://github.com/pfactum/${pkgname}.git")

sha256sums=(SKIP)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir -p build
  cd build

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr ..
  make -j$(nproc)
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  pwd
  make install
}

