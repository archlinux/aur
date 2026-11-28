# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=FCPS
_pkgver=1.5.0
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
  r-clustercrit
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
  r-gmeans
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
  r-otrimle
  r-paralleldist
  r-partitioncomparison
  r-pdfcluster
  r-pfclust
  r-plotly
  r-ppci
  r-prabclus
  r-pracma
  r-proc
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
  r-t4cluster
  r-tclust
  r-teigen
  r-varsellcm
  r-yardstick
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c0bbbbfe326b1aeef15146ed701b133b')
b2sums=('a338412eebe1503021c54976ea939fa05ee27800080c4eb265e12c50c055b59b36aa64b7716ed5ee2d0c8230768595e4b73d439a673a99d1ff433bb7b12b3c57')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
