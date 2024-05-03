# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GNOSIS
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Genomics explorer using statistical and survival analysis in R"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-car
  r-cbioportaldata
  r-comparegroups
  r-dashboardthemes
  r-desctools
  r-dt
  r-fabricatr
  r-fontawesome
  r-maftools
  r-magrittr
  r-operator.tools
  r-partykit
  r-rcolorbrewer
  r-reshape2
  r-rstatix
  r-shiny
  r-shinycssloaders
  r-shinydashboard
  r-shinydashboardplus
  r-shinyjs
  r-shinylogs
  r-shinymeta
  r-shinywidgets
  r-survminer
  r-tidyverse
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('36df6ab9836ea74234d54fba619a0e63')
b2sums=('559e13ad1c9fec582e86ceeb6f67711309f7afc58ae1de35005c3cc3380046c7d4b659ec2d036967992f8cf4464fef0d12b512e21d61233e4c175ccc0c932bb9')

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
