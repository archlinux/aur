# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miRSM
_pkgver=2.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Inferring miRNA sponge modules in heterogeneous data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-bibitr
  r-bicare
  r-biclust
  r-biobase
  r-clusterprofiler
  r-dbscan
  r-dose
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
  r-nmf
  r-org.hs.eg.db
  r-pma
  r-ppclust
  r-rcpp
  r-reactomepa
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
md5sums=('c6816f0e2fc48787e1c66416261129b6')
b2sums=('365142fce852088ca1d15d5f58ebae8fee5b1c58b2354a9323495c16bb4be2e636fb70084cc96a2fd68c9861162992c8abb84764cb46c3e632d77d1e2aa4a198')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
