# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=methylscaper
_pkgver=1.14.0
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
md5sums=('ce8efbce696cc7f66100c0d92108cf62')
b2sums=('ccb9d2334ed0e358cb66254ee6eea29134a1b3bdf5e68486b7bcb0b5e0098999e8ec0ca66133123020d63bbfbb753601aa283e550f3050105b08dc45c438d5cd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
