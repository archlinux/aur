# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ontologyIndex
_pkgver=2.11
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Reading Ontologies into R"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL)
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c252ea80927b096d3a0b8be63263aa11')
b2sums=('ddd7a2b51b0ab2ea66afe7b7db14a3d7b0270f19202848ff2c7b58965840455663520d7959da3fc2ebb99bea2ad2892d30a648fed89c4453a712895a1b62721e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
