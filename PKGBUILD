# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=FCPS
_pkgver=1.4.0
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
  r-cec
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
md5sums=('fc43876737d1ef5dc3d25534baab9087')
b2sums=('67e5dddad1ba3a579d3b12082d56cd043a4585242627dfd6173a7072178bdfa16deaee421c14d83faeb4210654991cfed2678f5f1d47d31e7f9e3ce5229f92e0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
