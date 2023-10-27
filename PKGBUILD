# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bnbc
_pkgver=1.23.0
pkgname=r-${_pkgname,,}
pkgver=1.23.0
pkgrel=1
pkgdesc='Bandwise normalization and batch correction of Hi-C data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-data.table
  r-ebimage
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-matrixstats
  r-preprocesscore
  r-rcpp
  r-rhdf5
  r-s4vectors
  r-summarizedexperiment
  r-sva
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6735fd14e4001db10018f3b81b8d0e27c820b429d9b824b53eec882354d1f4b9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
