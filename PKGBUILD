# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggformula
_pkgver=2.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Formula Interface to the Grammar of Graphics"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-cli
  r-ggiraph
  r-ggplot2
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
  r-ggdist
  r-ggforce
  r-ggplot2movies
  r-ggrepel
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
  r-quantreg
  r-quarto
  r-rmarkdown
  r-sf
  r-testthat
  r-tidyr
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('da2574e14020ac8b13402727e3d8e985')
b2sums=('5b34800d4f774d61fca6ee7b4e35dddb0f9cee71abac41c7ecafa122371541debb497abc442883c961b100a6a0523139204ca8706fcbb4973eaf150ae1a22a4c')

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
