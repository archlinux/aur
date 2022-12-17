# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DegNorm
_pkgver=1.8.1
pkgname=r-${_pkgname,,}
pkgver=1.8.1
pkgrel=1
pkgdesc='DegNorm: degradation normalization for RNA-seq data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-data.table
  r-doparallel
  r-foreach
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-heatmaply
  r-iranges
  r-plotly
  r-plyr
  r-rcpp
  r-rcpparmadillo
  r-rsamtools
  r-s4vectors
  r-viridis
)
optdepends=(
  r-formatr
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3d858d84f37452558cbd0fafd5ad80b4b0eae9ce4c00b5dde0d6034b67cf78ea')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
