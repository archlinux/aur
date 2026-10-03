# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=FCPS
_pkgver=1.4.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fundamental Clustering Problems Suite"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-datavisualizations
  r-ggplot2
  r-mclust
  pandoc
)
optdepends=(
  r-abcanalysis
  r-apcluster
  r-aricode
  r-cclust
  r-clue
  r-clusterability
  r-clusterr
  r-clustersim
  r-clustmixtype
  r-clustrd
  r-clustvarsel
  r-consensusclusterplus
  r-databionicswarm
  r-dbscan
  r-dendextend
  r-densityclust
  r-emcluster
  r-energy
  r-fastcluster
  r-flexclust
  r-generalizedumatrix
  r-genie
  r-hdclassif
  r-igraph
  r-kernlab
  r-knitr
  r-kohonen
  r-leiden
  r-mcl
  r-mixtools
  r-mlpack
  r-moments
  r-mstknnclust
  r-networktoolbox
  r-orclus
  r-paralleldist
  r-partitioncomparison
  r-pdfcluster
  r-pfclust
  r-plotly
  r-ppci
  r-prabclus
  r-pracma
  r-projectionbasedclustering
  r-protoclust
  r-r.utils
  r-reshape2
  r-rgl
  r-rmarkdown
  r-signal
  r-smacof
  r-sparcl
  r-spectrum
  r-tclust
  r-varsellcm
  r-yardstick
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9cf952f99f61d55f7649ce64779f6a80')
b2sums=('17812c34c25919ef080446836689c31df44b84a421bb438932bfe3398e29feb937fb4ce4f2341b3fb2e9c8d83cabc31edc9d205796f599236c4984fe652c63f0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
