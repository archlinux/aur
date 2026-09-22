# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Quartet
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Comparison of Phylogenetic Trees Using Quartet and Split Measures"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-ape
  r-plottools
  r-rdpack
  r-ternary
  r-treetools
)
makedepends=(
  r-rcpp
)
optdepends=(
  r-bookdown
  r-knitr
  r-phangorn
  r-rmarkdown
  r-testthat
  r-treedist
  r-usethis
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1e36360cacdf9749ff8b5e38400dbec6')
b2sums=('70e516c617e5c5e64f32cf26f6d69ad4171969af46f94000a458d21ac492da9efff4fa066e86592c91c2cadf5c2f7bc4d3b555b42976b475d03b8a8fd4d4ba92')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
