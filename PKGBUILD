# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PFP
_pkgver=1.7.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Pathway Fingerprint Framework in R"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-clusterprofiler
  r-ggplot2
  r-graph
  r-igraph
  r-kegggraph
  r-magrittr
  r-plyr
  r-tidyr
)
optdepends=(
  r-knitr
  r-org.hs.eg.db
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c360bbdb9e54a148f40c161c5691eceb')
b2sums=('0c5c132c587dca3566e75640dd581a1ef68969bc66e3eb107d2ed1e146e767edea8bc553727e1eab321ee44f30c18b103b2da4863aa9fba327b60cb64d1cfe5d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
