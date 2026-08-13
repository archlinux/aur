# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Quartet
_pkgver=1.3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Comparison of Phylogenetic Trees Using Quartet and Split Measures"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-ape
  r-rdpack
  r-ternary
  r-treetools
  r-viridislite
  r-plottools
)
makedepends=(
  r-rcpp
)
optdepends=(
  r-bookdown
  r-knitr
  r-phangorn
  r-rcpp
  r-rmarkdown
  r-testthat
  r-usethis
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c03e4a187a6332818a9762c90cd89c0c')
b2sums=('a7c44f7a3102f158178405b8fcb056694fa001b0ce538ebc0aa254366a00dae1d958e919ae7417356f81763302cfdb1c1409bfebb858d075018ddf89ac923f13')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
