# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=epiR
_pkgver=2.0.70
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
md5sums=('efde157d51b6f9b4b765c81d39c6b29f')
b2sums=('2156fbe27763954b43db87f4e24d72ad73c5ec5ee7110de134d46941ea6bb7b8145417fb6340c6c0a2c35502211ee1f707a351d59dd74bf79ccb006112b0d541')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
