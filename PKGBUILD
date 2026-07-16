# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gscreend
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Analysis of pooled genetic screens"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocparallel
  r-fgarch
  r-nloptr
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b182cf2171ae49d8709553f0092489a7')
b2sums=('b7ee328c361025ca6b7f94d43135a2f4970fa17213987fd2113ad84837d6fcad0ecfe9b633f1d47ea27c699f0bb0b9500fb97a3e0a11dbc52cef0c75c5c47910')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
