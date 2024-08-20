# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MALDIquant
_pkgver=1.22.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Quantitative Analysis of Mass Spectrometry Data"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
optdepends=(
  r-knitr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6fc718a13b57fd3aebb1091f07bce3d9')
b2sums=('a31b1250a989a78e9768d9d8987bead5c7327f897c7d655bf51d0895f101efd3ecc600266cf66152d54197c61f07278373beca5c0965724e1216cbf1e2b0f56a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
