# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miRSM
_pkgver=2.0.2
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
md5sums=('fbf26013db3fb184046314774563ea30')
b2sums=('76fb928c4b813f715bc1e4f10ce21bfc8e9e1d6ab2b3512feb94e7df1a982035ed197953ac94eb431c25f3a98c3fba8a1ca766e947902fe4322d9e4950722610')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
