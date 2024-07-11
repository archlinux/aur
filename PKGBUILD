# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=datawizard
_pkgver=0.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Easy Data Wrangling and Statistical Transformations"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-insight
)
optdepends=(
  r-bayestestr
  r-brms
  r-curl
  r-data.table
  r-dplyr
  r-effectsize
  r-emmeans
  r-gamm4
  r-ggplot2
  r-gt
  r-haven
  r-htmltools
  r-httr
  r-knitr
  r-lme4
  r-mediation
  r-modelbased
  r-parameters
  r-poorman
  r-psych
  r-readr
  r-readxl
  r-rio
  r-rmarkdown
  r-rstanarm
  r-see
  r-testthat
  r-tibble
  r-tidyr
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c7a0ad19625384b12cd0b1ffb99b375e')
b2sums=('f9d61f4653758eb20238c4c4f3d7e82b5e808c8a25447d2d42f969bb02d566332113a320e68f100f6ef45c148d424b4c66c2f2ff48184c917953e79b325abb22')

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
