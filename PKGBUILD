pkgname=argparse
pkgver=2.9
pkgrel=1
pkgdesc="Argument Parser for Modern C++"
arch=(any)
url="https://github.com/p-ranav/argparse"
license=("MIT")
makedepends=("cmake")
source=("https://github.com/p-ranav/argparse/archive/v${pkgver}.tar.gz")
sha512sums=("fa471e7d8c448510376e79927496f62775e6ed37e1dffefd607839e6005dfbc61125d0e18bfc1ff20f86cef7efd75339d7bb143dc6574d988f83c7c96896fa5f")

build() {
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -B"${srcdir}/${pkgname}-${pkgver}" \
        -H"${srcdir}/${pkgname}-${pkgver}"
  cmake --build "${srcdir}/${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" -C "${srcdir}/${pkgname}-${pkgver}" install
}

# vim:set ts=2 sw=2 et:
