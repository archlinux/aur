# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggformula
_pkgver=1.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Formula Interface to the Grammar of Graphics"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-ggplot2
  r-ggiraph
  r-ggridges
  r-labelled
  r-mosaiccore
  r-rlang
  r-scales
  r-stringr
  r-tibble
)
optdepends=(
  r-broom
  r-covr
  r-dplyr
  r-ggforce
  r-ggplot2movies
  r-ggthemes
  r-glue
  r-hexbin
  r-interp
  r-knitr
  r-lubridate
  r-maps
  r-mosaic
  r-mosaicdata
  r-palmerpenguins
  r-patchwork
  r-purrr
  r-quarto
  r-quantreg
  r-rmarkdown
  r-sf
  r-testthat
  r-tidyr
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f8277dffa86ef7b075145e369de189e4')
b2sums=('4d15c60e6786ee132595a330ac7094dcbfc3664f69648cb693d212e46792cfc349e278461f0d3ee416f2c14e7e9e4b972d27e596b24bebe9b93648a6f1dca225')

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
