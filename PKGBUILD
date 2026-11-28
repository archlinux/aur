# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=gtsummary
_pkgver=2.7.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Presentation-Ready Data Summary and Analytic Result Tables"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-cards
  r-cardx
  r-cli
  r-dplyr
  r-glue
  r-gt
  r-lifecycle
  r-rlang
  r-tidyr
  r-vctrs
)
optdepends=(
  r-aod
  r-broom
  r-broom.helpers
  r-broom.mixed
  r-car
  r-cmprsk
  r-effectsize
  r-emmeans
  r-flextable
  r-geepack
  r-ggstats
  r-huxtable
  r-insight
  r-kableextra
  r-knitr
  r-lme4
  r-mice
  r-officer
  r-openxlsx
  r-parameters
  r-parsnip
  r-rmarkdown
  r-smd
  r-spelling
  r-survey
  r-testthat
  r-withr
  r-workflows
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('955772be8db738172e46623c2e54dadc')
b2sums=('e3bcf724521ee7904011bc387d8186b8416c2f340b7ba3929e962018cca8f61af183c1783f9128fe8c6a870b4523ef7abbe688f73c254d4b6c7be3b40a24816a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
