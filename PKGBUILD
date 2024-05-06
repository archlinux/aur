# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miRSM
_pkgver=2.0.0
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
md5sums=('6b768ed0848c09a94d025ad3c3c5d9b8')
b2sums=('6b68f35c54b1ad7d6b97da1127ba9a38e8d0110fce4a902e5569a4f0c31487dacf156728722cb2968d5a1211e09a124f90362bf7c1b4b1447d742688a4b74358')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
