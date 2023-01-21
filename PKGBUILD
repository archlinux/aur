# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GeneticsPed
_pkgver=1.60.3
pkgname=r-${_pkgname,,}
pkgver=1.60.3
pkgrel=1
pkgdesc='Pedigree and genetic relationship functions'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-gdata
  r-genetics
)
optdepends=(
  r-gtools
  r-runit
)
makedepends=(
  gcc-fortran
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b73b740d8eff7cddee97bc442e4fb5c79a6805e33ef6855fe69f8c08e23337c9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
