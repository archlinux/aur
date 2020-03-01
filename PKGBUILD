pkgname=argparse
pkgver=2.1
pkgrel=1
pkgdesc="Argument Parser for Modern C++"
arch=(any)
url="https://github.com/p-ranav/argparse"
license=("MIT")
makedepends=("cmake")
source=("https://github.com/p-ranav/argparse/archive/v${pkgver}.tar.gz")
sha512sums=("35746e0b526bd4406c954ab315f191abc57b08b48a047f108ddacc7baace406d3ddddb1af23d41caff565afecfeb41dfedd27a08cdba8d11b59dbe7c78b7e9b0")

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
