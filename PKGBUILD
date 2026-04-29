# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=iSEEindex
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="iSEE extension for a landing page to a custom collection of data sets"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocfilecache
  r-dt
  r-isee
  r-paws.storage
  r-rintrojs
  r-shiny
  r-shinydashboard
  r-shinyjs
  r-singlecellexperiment
  r-stringr
  r-summarizedexperiment
  r-urltools
)
optdepends=(
  r-biocstyle
  r-covr
  r-knitr
  r-refmanager
  r-rmarkdown
  r-sessioninfo
  r-testthat
  r-yaml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c8826a870015f12a9b5804a5514090c5')
b2sums=('83640481bde24e8a363edf778baa75ccc83b3539d8cd9eaeff46571d45ba133516b9f6e6fda89468e8033368069fa161736151c4d0fc072a88c383cb84c2b03c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
