# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=epiR
_pkgver=2.0.95
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
md5sums=('62ff75232c68c8dde61e36ecf2560575')
b2sums=('1fe169937db6b8e61316e2c0e360520f886193b22523ad7a712e345dc2fe413b0c01c2febd52bf21be4dbdeddf2c5f0dbe172fac9e7e48f7f8f53ca0b9eb9f10')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
