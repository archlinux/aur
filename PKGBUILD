# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BG2
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Performs Bayesian GWAS analysis for non-Gaussian data using BG2"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-caret
  r-ga
  r-memoise
)
optdepends=(
  r-biocstyle
  r-formatr
  r-knitr
  r-rmarkdown
  r-rrblup
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('da6ea59dda3c728bdce70a5b43e4541e')
b2sums=('51810f06ff9e203dc1a8614cd63378eb7bd4e6bfaf6d8069caf5cff137d2157b7d0764ebf7afa43068949ed6cad13563b3e3ac895b332b3f68e2aa9151641b9d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
