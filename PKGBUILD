# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=data.tree
_pkgver=1.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="General Purpose Hierarchical Data Structure"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-r6
  r-stringi
)
optdepends=(
  r-ape
  r-diagrammer
  r-doparallel
  r-foreach
  r-formula
  r-htmlwidgets
  r-jsonlite
  r-knitr
  r-mockery
  r-networkd3
  r-party
  r-partykit
  r-rmarkdown
  r-testthat
  r-treemap
  r-yaml
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2cb316683cdf181900d26e49b69d7f79')
b2sums=('a04a96ae2d95db3a8ff678c45f06ee9a0747e6767d2d6f06c4bb90487d440f7f2d1d4b1c2f2ad7ec11dcedfc2c81debf0afaa00a805cdf29a2189290493e25dd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
