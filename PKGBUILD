# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=stabs
_pkgver=0.6-4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Stability Selection with Error Control"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-gamboostlss
  r-glmnet
  r-hdi
  r-knitr
  r-lars
  r-mboost
  r-rmarkdown
  r-testthat
  r-th.data
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b05e82dca362b6442b1c2d2970252509')
b2sums=('4c29ed288d3386fe6293b9eeb11fb316879ecb6a1d1198e8fab711fd9b60f283072ea1c0b040d0cd67aa7d34222979a480ae13170b905855e0b72287e9f80108')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
