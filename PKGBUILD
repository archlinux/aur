# Maintainer: Martin Diehl <aur@martin-diehl.net>
pkgname=neper
pkgver=4.8.2
pkgrel=1
pkgdesc='Polycrystal generation and meshing'
arch=('x86_64')
url='https://neper.info'
license=('GPL-3.0-only')
depends=('nlopt'
         'gmsh'
         'scotch'
         'gsl')
makedepends=('cmake')
source=(neper-${pkgver}.tar.gz::https://github.com/neperfepx/neper/archive/refs/tags/v${pkgver}.tar.gz)

sha512sums=('bbeab53a3f0b9a4352aed03810bc40eebcf4714fc594eea7fc48ba5e5ea755dedd5709d256c5ff4b204ce5f32a94b2e9742c1e0f6128cdbe3ba6faefb8da45ca')

build() {
  cmake -S ${pkgname}-${pkgver}/src \
        -B build \
        -D CMAKE_INSTALL_PREFIX:PATH=/usr
  make -C build
}


package() {
  DESTDIR=${pkgdir} cmake --install build
}
