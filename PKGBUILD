# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=BFF
_pkgver=5.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Bayes Factor Functions"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-dpq
  r-ggplot2
  r-gsl
  r-rlang
)
optdepends=(
  r-bsda
  r-knitr
  r-rmarkdown
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('67d1a5001f4b5898c823536931704539')
b2sums=('eea9f5628017d51721a8ddd1a55186fe1e265afb3d87e417e2e74b0dbbccc490908d75871a5e6da34f02dcd9b43a891cfad6d1076bb5f98db9dd76016366e2b9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
