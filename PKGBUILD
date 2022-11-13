# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miRSM
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='Inferring miRNA sponge modules in heterogeneous data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bibitr
  r-bicare
  r-biclust
  r-biobase
  r-dbscan
  r-dynamictreecut
  r-energy
  r-fabia
  r-flashclust
  r-gfa
  r-gseabase
  r-ibbig
  r-igraph
  r-isa2
  r-linkcomm
  r-matrixcorrelation
  r-mcl
  r-mclust
  r-mirsponger
  r-nmf
  r-org.hs.eg.db
  r-pma
  r-ppclust
  r-rcpp
  r-rqubic
  r-s4vd
  r-sombrero
  r-subspace
  r-summarizedexperiment
  r-wgcna
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3623a511bcf89826ed523cbda69713d41a9988509d4ba6f26e914d3cf96b6b94')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
