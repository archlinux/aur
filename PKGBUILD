# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>
# Submitter: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>

pkgname=packmol
pkgver=18.169
pkgrel=1
pkgdesc="Creates an initial point for molecular dynamics simulations by packing molecules in defined regions of space."
depends=("gcc-libs" "tcl" "bash")
makedepends=("gcc-fortran")
arch=("x86_64")
license=("MIT")
url="http://www.ime.unicamp.br/~martinez/packmol/"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mcubeg/packmol/archive/${pkgver}.tar.gz")
sha1sums=('6489a047347479bc8b9af67e1dd2613cb75ed4cf')

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
