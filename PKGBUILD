# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=waffle
_pkgver=1.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Create Waffle Chart Visualizations"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
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
sha256sums=('e650803b4ec3c6a0aca02b1d9430d23d603d86f9782d90b96f698a6b692de09f')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
