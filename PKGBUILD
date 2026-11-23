# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=pagoda2
_pkgver=1.0.15
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Single Cell Analysis and Differential Expression"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  blas
  lapack
  r-dendsort
  r-drat
  r-fastcluster
  r-igraph
  r-irlba
  r-magrittr
  r-n2r
  r-plyr
  r-r.utils
  r-r6
  r-rcpp
  r-rjson
  r-rlang
  r-rmtstat
  r-rook
  r-rtsne
  r-sccore
  r-urltools
)
makedepends=(
  r-rcpparmadillo
  r-rcppeigen
  r-rcppprogress
)
optdepends=(
  r-annotationdbi
  r-base64enc
  r-biocgenerics
  r-biocparallel
  r-colorramps
  r-data.table
  r-dbscan
  r-dplyr
  r-ggplot2
  r-go.db
  r-gridextra
  r-knitr
  r-org.dr.eg.db
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-pcamethods
  r-pheatmap
  r-rgl
  r-rmarkdown
  r-robustbase
  r-scde
  r-testthat
  r-uwot
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('637f553168dac656581a6e7b44322bb7')
b2sums=('269c8cde5c546ea91ca33ffe8dfea438e4e7ac0f8b27de4ea8197a0489e74f34ec617cb3af14b8f0a04d7bc9302bcb684d53620cf07a12fd6777fc676bf40699')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
