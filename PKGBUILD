# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=epiR
_pkgver=2.0.81
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools for the Analysis of Epidemiological Data"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biasedurn
  r-flextable
  r-lubridate
  r-officer
  r-pander
  r-sf
  r-zoo
)
optdepends=(
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
md5sums=('901dee4a589b5b0d9e5eee3d34421983')
b2sums=('d33d6447fe37e9f81509c6004c38d054fe09b66614e0b605cfafad949f746c69d4e2ebe54bd1c45dce71ad26c8149cb37cd7e5684802b8cc91ae7af1d2b3f774')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
