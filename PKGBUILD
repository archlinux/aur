# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=FCPS
_pkgver=1.3.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Fundamental Clustering Problems Suite"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  pandoc
  r-datavisualizations
  r-ggplot2
  r-mclust
)
optdepends=(
  r-abcanalysis
  r-adpclust
  r-apcluster
  r-cclust
  r-cec
  r-clusterability
  r-clusterr
  r-clustersim
  r-clustmixtype
  r-clustrd
  r-clustvarsel
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
  r-plotly
  r-ppci
  r-prabclus
  r-pracma
  r-prclust
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
  r-subspace
  r-tclust
  r-varsellcm
  r-yardstick
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('749ba6fd6322916b39cfcbc8843280a8')
b2sums=('0d822e5c94194edca9738be6c939a190f1b66820a8df173fd99d301e7744b497312e467d4a903cd9421661159b5a502c799bf94e0e35caf8d1fb89f86a26ad99')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
