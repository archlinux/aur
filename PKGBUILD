# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=iSEEindex
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('1eebe6478ce84cd14d9ee12be9d17968')
b2sums=('93311daf54c65ad25a2e61589e7659c09a37a4b648907e3fa5c514da3356b21a8731fdf51a3e241bbb21404247cc8c74775bb41e0ad56b32675c2d70f8889202')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
