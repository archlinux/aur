# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=epiR
_pkgver=3.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools for the Analysis of Epidemiological Data"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biasedurn
  r-dfba
  r-flextable
  r-lubridate
  r-officer
  r-pander
  r-sf
  r-zoo
)
optdepends=(
  r-bookdown
  r-dplyr
  r-ggplot2
  r-knitr
  r-plyr
  r-rcolorbrewer
  r-rmarkdown
  r-scales
  r-sp
  r-spatstat
  r-spdata
  r-tidyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1b6baa0ae31627f598e16e1df17bd2f2')
b2sums=('9bcda59149f337c8fd55266bb9168a78cc8c01bf804809984ca4bb9358ddb46690e15db087af6aadd060d56fe90a0b05a71a01019c07471a6050d9431d75952c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
