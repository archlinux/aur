# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=FCPS
_pkgver=1.4.1
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
md5sums=('06a53394e64cd50ac2ef046523c5d082')
b2sums=('dc7308febf12dfb8d412d5ae9324e3000f5ad2c2fb286c2ca68d5103b736a3220ad1ed267297f1430ca39a28d64d029ad6032b669417d0c56c5c1bee39da3b58')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
