# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GET
_pkgver=1.0-2
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
md5sums=('62b362832241939526359414b21b6c18')
b2sums=('8ef0faabe2d69bc4738d973126d9f2008930e7eacccc0a8d19c06297218ea94b856c9e663fea7a454e24ac399052297d017799652c1a84b6cb77569f4218f5e8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
