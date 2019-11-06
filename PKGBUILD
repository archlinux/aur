pkgname=argparse
pkgver=1.9
pkgrel=1
pkgdesc="Argument Parser for Modern C++"
arch=(any)
url="https://github.com/p-ranav/argparse"
license=("MIT")
makedepends=("cmake")
source=("https://github.com/p-ranav/argparse/archive/v${pkgver}.tar.gz")
sha512sums=("6cfc7fc274a11093fe5254f244adaacdcc81123b1d7e9b51110ffdfe9a344fb59044ec9d98017f25aa8ea417d57cfca330fdea7161226da26f1b4fc199fdc4fb")

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
