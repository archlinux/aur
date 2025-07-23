# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qlcMatrix
_pkgver=0.9.9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Utility Sparse Matrix Functions for Quantitative Language Comparison"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-docopt
  r-slam
  r-sparsesvd
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('aeb107f57e3012bbe64cfef64e7f470c')
b2sums=('78554d519ed8891e6b8af8ca1f522df2377bb642da019dd01adff5b73c5f688d4cd51f90b4ee41eaa8e8dfaa2ffd5330dc1f432380de5b727972726321b71164')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
