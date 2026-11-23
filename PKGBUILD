# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=spatialreg
_pkgver=1.4-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Spatial Regression Analysis"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  blas
  lapack
  r-coda
  r-learnbayes
  r-marginaleffects
  r-multcomp
  r-mvtnorm
  r-sf
  r-spdata
  r-spdep
)
optdepends=(
  r-codingmatrices
  r-expm
  r-igraph
  r-knitr
  r-lmtest
  r-rmarkdown
  r-rspectra
  r-sandwich
  r-spam
  r-tinytest
  r-tmap
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d93d3644df84362beaff02f474ed351b')
b2sums=('3a1ebd96a891212fce8198fbf754d8b6be076b86a0029ebf2c8d090e8a3143388056a9f95aa92cdbd7d98d31716701815418efbbb37a0b37122cb708fdcc116a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
