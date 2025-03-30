# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GET
_pkgver=1.0-5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Global Envelopes"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-ggplot2
  r-gridextra
  r-viridislite
)
optdepends=(
  r-crayon
  r-fda
  r-fda.usc
  r-geor
  r-gstat
  r-locfit
  r-mvtnorm
  r-patchwork
  r-quantreg
  r-r.rsp
  r-sp
  r-spatstat.explore
  r-spatstat.geom
  r-spatstat.linnet
  r-spatstat.model
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9c53e2048d81e3ae1387feeda9e2a3ff')
b2sums=('55aec7926104880e24628d1bdb642c99e6d80bd93e1c9a7605f950eb967fbd2dbad2254aff4cedda56a4547f95896e1739775309fd9f677ffc07c017802a2d35')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
