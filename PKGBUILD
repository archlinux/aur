# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=methylscaper
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Visualization of Methylation Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biocparallel
  r-biostrings
  r-data.table
  r-rfast
  r-seqinr
  r-seriation
  r-shiny
  r-shinyfiles
  r-shinyjs
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-devtools
  r-knitr
  r-r.utils
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0fae72e2aac98ec4a55d8aa4343039ba')
b2sums=('a0e2d398a8a537dd26314c6c60cbfe5cc6211c22223a866f3bbb56304793547f1211c7f77487ef478e0df69ddeb60cafbf747ed150d8798dc1aea2ea3c284f68')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
