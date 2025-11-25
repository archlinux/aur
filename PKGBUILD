# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gt
_pkgver=1.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Easily Create Presentation-Ready Display Tables"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-base64enc
  r-bigd
  r-bitops
  r-cli
  r-commonmark
  r-dplyr
  r-fs
  r-glue
  r-htmltools
  r-htmlwidgets
  r-juicyjuice
  r-magrittr
  r-markdown
  r-reactable
  r-rlang
  r-sass
  r-scales
  r-tidyselect
  r-vctrs
  r-xml2
)
optdepends=(
  r-farver
  r-fontawesome
  r-ggplot2
  r-gtable
  r-katex
  r-knitr
  r-lubridate
  r-magick
  r-paletteer
  r-rcolorbrewer
  r-rmarkdown
  r-rsvg
  r-rvest
  r-shiny
  r-testthat
  r-tidyr
  r-webshot2
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('562016ec4d84220cb848b0e6c4e5b149')
b2sums=('e05de00335b0435bc6fd737339213de09839acb5070bedceb56e4d1c34d3d7d784c3a2f92f0a388b77f27861e724556f24c948efd778104aa655c0772b9994ec')

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
