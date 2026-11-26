# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MetaboCoreUtils
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Core Utils for Metabolomics Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocparallel
  r-mscoreutils
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-robustbase
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('12573be97b3d0af6f3e4307dbdee4acc')
b2sums=('59668c914dd2bcd4268530cb4ce2d9c97685a9d405d4f0edb511af1376e853f568a5697a1c79f39b914dda5570738685ab4afc14481aecf1be4fb5baf32a55e9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
