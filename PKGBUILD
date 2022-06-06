# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gdsfmt
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='R Interface to CoreArray Genomic Data Structure (GDS) Files'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
)
optdepends=(
  r-biocgenerics
  r-crayon
  r-digest
  r-knitr
  r-markdown
  r-matrix
  r-parallel
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('000ff7bdfc325b8f37159d3bd3219fec95d2f92972ac2461e1de30f776f4bcb1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
