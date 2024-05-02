# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AnVIL
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bioconductor on the AnVIL compute environment"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocbaseutils
  r-biocmanager
  r-dplyr
  r-dt
  r-futile.logger
  r-htmltools
  r-httr
  r-jsonlite
  r-miniui
  r-rapiclient
  r-rlang
  r-shiny
  r-tibble
  r-tidyr
  r-tidyselect
  r-yaml
)
optdepends=(
  r-biocstyle
  r-devtools
  r-knitr
  r-readr
  r-rmarkdown
  r-testthat
  r-withr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('94fb4603d3b7393d249feb4e2186945d')
b2sums=('f2ee176e91be9c3db0c09502cf4f8cec9dccbd151c6368c7fd88fe1d47caf122fb00dcd4f764cd20bccfe85096e32d20afee6f8b0ee834268857b2265769e6c4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
