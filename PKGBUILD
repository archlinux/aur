# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=immApex
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Tools for Adaptive Immune Receptor Sequence-Based Machine and Deep Learning"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-immreferent
  r-matrixstats
  r-rcpp
  r-singlecellexperiment
  r-stringr
)
optdepends=(
  r-biocstyle
  r-dplyr
  r-ggplot2
  r-ggraph
  r-igraph
  r-knitr
  r-markdown
  r-peptides
  r-randomforest
  r-rmarkdown
  r-screpertoire
  r-spelling
  r-testthat
  r-tidygraph
  r-viridis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1ee4a87bc0162ebf1697d0e7f9c2455a')
b2sums=('37cceaf9aa81a08da042da6704c65d15afcbd1a9c2920e57b3d2c868f44bc82d91cf88354e263b3850281a1ccba827964606ca4bec269afdf7ffc056ad878257')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
