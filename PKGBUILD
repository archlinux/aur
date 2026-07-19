# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GET
_pkgver=1.0-9
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
  r-rlang
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
  r-sf
  r-sp
  r-spatstat.explore
  r-spatstat.geom
  r-spatstat.knet
  r-spatstat.linnet
  r-spatstat.model
  r-spatstat.random
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fd0802df99a3ca7632d51c1c1effba7b')
b2sums=('cb1b3e2b664116c17ff6bab3b320200e23018527203096641af9585e84c0ca30f5182e8ef90e22612e9f23ebe25d8015252b5c412826c8371a85392e48599039')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
