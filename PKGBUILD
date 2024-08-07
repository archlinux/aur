# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gt
_pkgver=0.11.0
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
  r-digest
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
md5sums=('6f3b6950a4aaeae6a91fa6323b8354ca')
b2sums=('7d68aa541ee73b0c8205807c811b462d3c90d2655a4d6e654dc3888cf076ee92c68ea1fedacb30495e1eab558e6b50d61ef3f342dc9cdd779002cc08e1aecde3')

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
