# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=conos
_pkgver=1.5.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Clustering on Network of Samples"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  blas
  lapack
  r-abind
  r-complexheatmap
  r-cowplot
  r-dendextend
  r-dplyr
  r-ggplot2
  r-ggrepel
  r-gridextra
  r-igraph
  r-irlba
  r-leidenalg
  r-magrittr
  r-n2r
  r-r6
  r-reshape2
  r-rlang
  r-rtsne
  r-sccore
)
makedepends=(
  r-rcpp
  r-rcpparmadillo
  r-rcppeigen
  r-rcppprogress
)
optdepends=(
  r-annotationdbi
  r-biocparallel
  r-conospanel
  r-deseq2
  r-drat
  r-entropy
  r-ggrastr
  r-go.db
  r-jsonlite
  r-knitr
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-p2data
  r-pagoda2
  r-plyr
  r-pma
  r-rhdf5
  r-rmarkdown
  r-rmumps
  r-seurat
  r-shinycssloaders
  r-summarizedexperiment
  r-testthat
  r-tibble
  r-uwot
  r-zoo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ebbd6a030dabdbcff607dee0bd937081')
b2sums=('a75b7e6a25e3f41feb1884d6bf266c7f8feeefb458b27c6adb5195e029f11b32172bdff694a7a081a3309ba920b71d46468d14d93b770ca6dee05a12c7a3ff56')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
