# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=waffle
_pkgver=1.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Create Waffle Chart Visualizations"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-curl
  r-dt
  r-extrafont
  r-ggplot2
  r-gridextra
  r-gtable
  r-htmlwidgets
  r-plyr
  r-rcolorbrewer
  r-rlang
  r-stringr
)
optdepends=(
  r-dplyr
  r-ggthemes
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5d8baee6c96eb2a1e7b8001ef159f45e')
b2sums=('177be7d9eb1abcc7c223088ec34ecfec636f6157648f60f57872e13f1ae007052c9e1b6226073618afbde65a942291b96ac82ada2882aa261a4c376377e2e6d4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
