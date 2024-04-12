# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dtangle
_pkgver=2.0.9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Cell Type Deconvolution from Gene Expressions"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-deoptimr
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c9744317ddbfaa3ed02eb25ca7f65f4a')
b2sums=('92f2955f9921d153248b474bd564e86223b521d4d9349cc60f36fbb68fc25f1ee1cc855329e89875a9352f5430ddd035e140d6908444451f471fec5c3ca7c1c6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
