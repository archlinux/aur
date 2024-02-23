# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Quartet
_pkgver=1.2.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('e1108c1a7340e560bdeadef946bcaff5')
b2sums=('bd479c35833188803c3954bf8c787741d8d379df13558b89487e9096142fba47056b33780af596804d79384be2cec53175cbf80953ddca51cd362f26a07e04ef')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
