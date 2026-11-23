# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=conos
_pkgver=1.5.4
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
  r-pagoda2
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
md5sums=('bee312a8b31f3de1bdc31d35dbc012e0')
b2sums=('f2e26ad19c6c0bb700c25f26b8be66ceeb418649045156217d99c17fc9d8414ba0062c5dd633f1484c1df08e12fdbf725288896e636060ebff79861c7e9f8227')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
