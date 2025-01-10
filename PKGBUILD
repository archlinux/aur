# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=datawizard
_pkgver=1.0.0
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
md5sums=('0cf4ed6c6a2983b200d126609382c344')
b2sums=('4840c1825d2ef3d6c0f3a207930b3bd3d52f0817c6d45dbb1db1392fc762083f0ef9ee710a8878d9dadf2661c0b59f5d356a0e91de3d0d0f8435d3967d0f3f70')

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
