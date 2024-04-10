# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=epiR
_pkgver=2.0.73
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
  r-mapproj
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
md5sums=('14797c43eae021a50c804f765105df86')
b2sums=('7f76dfd7efc4ba7f8adf54862eeaf1574d3941f167ee0c5899487cedda28d1623a87c5b5711ed83146202cca924487d13423bbf204df587672a8a19efb3e93b7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
