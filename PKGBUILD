# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=martini
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='GWAS Incorporating Networks'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-igraph
  r-rcpp
  r-rcppeigen
  r-snpstats
  r-biomart
  r-circlize
  r-httr
  r-iranges
  r-knitr
  r-memoise
  r-readr
  r-rmarkdown
  r-s4vectors
  r-stringdb
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('44bb3b757ff993bb63a461b2d8bd54b7930df4bea9f9d04f34db422572a17710')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
