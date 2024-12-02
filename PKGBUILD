# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GET
_pkgver=1.0-4
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
md5sums=('642d694d0fc0688ae987d66abdaa554e')
b2sums=('10c6d58c12bc018f9a9b6db5ff631d545369a786f981f72aa11e6faffed6db6e23d7119bc0746e05d7eecacfd5b2a44863d0144d21a145341104bde9cfebcb16')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
