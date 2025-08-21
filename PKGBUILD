# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

_pkgname=compositions
_pkgver=2.0-9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Compositional Data Analysis"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  blas
  lapack
  r-bayesm
  r-robustbase
  r-tensora
)
optdepends=(
  r-combinat
  r-energy
  r-knitr
  r-rgl
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7fd8ba31c07a6fd7cb26da6f46cf54f1')
b2sums=('880aae4163578062479746f7f66042c98ba65ba2a12e228e62300d2e4895aba3aabe0d4f5e6a65090f280fa5e8220b72c7f67784e49ce4f904c8a2bf6035f466')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
