# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=immApex
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('af21920c98cef03e32008fc9e0b012a1')
b2sums=('bc9866e7c1d1220fe944c23da8d44a2cee69d0d6253b7177c4419cbf2c440d8debd86b885808a1699231d6c9fd5df7e87196ee945b842978f7b980285fe7593b')

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
