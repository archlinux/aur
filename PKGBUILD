# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>
# Submitter: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>

pkgname=packmol
pkgver=20.010
pkgrel=1
pkgdesc="Creates an initial point for molecular dynamics simulations by packing molecules in defined regions of space."
depends=("gcc-libs" "tcl" "bash")
makedepends=("gcc-fortran")
arch=("x86_64")
license=("MIT")
url="http://www.ime.unicamp.br/~martinez/packmol/"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mcubeg/packmol/archive/${pkgver}.tar.gz")
sha256sums=('23285f2a9e2bef0e8253250d7eae2d4026a9535ddcc2b9b383f5ad45b19e123d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -D -m755 packmol "${pkgdir}"/usr/bin/packmol
  install -D -m755 solvate.tcl "${pkgdir}"/usr/bin/solvate.tcl
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/packmol/LICENSE
}
