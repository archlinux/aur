# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gt
_pkgver=1.2.0
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
md5sums=('7d87e212c83e0a9ea76a2bd0ee72d784')
b2sums=('ab9a31823bbfba3c31b265f0dea7643f4cd92977c6f2bf16c7817b71fc45e15d10e9c0443643856b0e5b6074087709be3c4052690614c1d0577aed6c8013c510')

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
