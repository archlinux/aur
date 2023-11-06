pkgname=argparse
pkgver=3.0
pkgrel=1
pkgdesc="Argument Parser for Modern C++"
arch=(any)
url="https://github.com/p-ranav/argparse"
license=("MIT")
makedepends=("cmake")
source=("https://github.com/p-ranav/argparse/archive/v${pkgver}.tar.gz")
sha512sums=('a7ed879eb3f71868cd84e513c0db63c4fecff1c9f0b34d6cfbe85d2439e83b80e97f713b497259c9775c9c7c1f639a08b73080045c51756de15e3d8c18b97116')

build() {
  cmake -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -B"${srcdir}/${pkgname}-${pkgver}" \
        -H"${srcdir}/${pkgname}-${pkgver}" \
        -DARGPARSE_BUILD_TESTS=OFF
  cmake --build "${srcdir}/${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" -C "${srcdir}/${pkgname}-${pkgver}" install
}

# vim:set ts=2 sw=2 et:
