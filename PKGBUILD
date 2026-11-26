# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=methylscaper
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Visualization of Methylation Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biocparallel
  r-biostrings
  r-data.table
  r-pwalign
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
md5sums=('274599bf3fe446a4e9634277ad39c607')
b2sums=('7a3ad297a1567405ccc2c972c0518e386d7af659d8935635e5e8fcd5456004e1721408ed74bc28a1138f3074829a9fb5f8f3fb6cd1a84fe8105679233a15a0a5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
