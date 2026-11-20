# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qap
_pkgver=0.2-0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Heuristics for the Quadratic Assignment Problem (QAP)"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d2d14f438e052226955a6e0eb5419b94')
b2sums=('ac0d5ba5e700db154b9d5b83647d95be84e911ad58fcafabe819e60503be483d837542f141752527bd75bf9c738d5ca104cd629475eb86d54d7acdf3b7134c0f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
