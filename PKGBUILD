# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Quartet
_pkgver=1.2.7
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
md5sums=('23c2afb6d467ee691058c84c964be386')
b2sums=('6dbd68e5cdbf4df38e8410e813c906c0d376c2e910a0b744dc92303491758140fb4308ca27bcc5be932bf5395a38fcefdab465156a6c9549668a54ed96e9086e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
