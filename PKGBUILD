# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=statsExpressions
_pkgver=1.6.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tidy Dataframes and Expressions with Statistical Details"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-afex
  r-bayesfactor
  r-bayestestr
  r-correlation
  r-datawizard
  r-dplyr
  r-effectsize
  r-glue
  r-insight
  r-magrittr
  r-parameters
  r-performance
  r-pmcmrplus
  r-purrr
  r-rlang
  r-rstantools
  r-tidyr
  r-withr
  r-wrs2
  r-zeallot
)
optdepends=(
  r-ggplot2
  r-knitr
  r-metabma
  r-metafor
  r-metaplus
  r-patrick
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5dd904c3c2c04090a5dc35288289f352')
b2sums=('1bc230d98392eaf9b76e81d0c128a5211350b26b22cf071366c2211cd3b4ededc805522a728959b87acbe5f7315861e4725245117af6f8f426eaa875cdc8a2fe')

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
