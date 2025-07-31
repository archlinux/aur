# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggformula
_pkgver=0.12.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Formula Interface to the Grammar of Graphics"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
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
  r-ggplot2movies
  r-ggthemes
  r-interp
  r-knitr
  r-lubridate
  r-maps
  r-mosaic
  r-mosaicdata
  r-palmerpenguins
  r-purrr
  r-quantreg
  r-rmarkdown
  r-sf
  r-testthat
  r-tidyr
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0c76f76c6efb488674b6004a0f357c3e')
b2sums=('cf3f7d1bbc4d6dc5dc1d09be1e8aa16762e7fbaa3e35dd47b6a65baa491c4f7aa0f4cf8d653d6baf5b7fd31d98964da02b7217b636eb77455f876401ffd4d081')

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
