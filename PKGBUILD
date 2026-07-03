# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GET
_pkgver=1.0-8
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
md5sums=('bcbec329700dd3d24e56f27de16599c6')
b2sums=('a6f7855aad64b430b04d82db2412f768d912ae82b47c75cbec7473951ad87c82d6054d4f6f2879b9c9cffb14839367d78e9d907a21f93f7c3dcc2bce62d2712f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
