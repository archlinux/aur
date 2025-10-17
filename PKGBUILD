# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=matrixTests
_pkgver=0.2.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast Statistical Hypothesis Tests on Rows and Columns of Matrices"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-matrixstats
)
optdepends=(
  r-car
  r-cosinor
  r-cosinor2
  r-moments
  r-nortest
  r-pmcmrplus
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('96b2e74ea3ae52c7f2987746aec6ccab')
b2sums=('1819b37baf337cdac4bfedff3638a2765a7c9b4274c794d8631f699197f9d76045470cbdefac78cbebe7375bb61916b46018d3eff30dfd666b78296fcadcd259')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
