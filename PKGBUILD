# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fmrs
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Variable Selection in Finite Mixture of AFT Regression and FMR Models"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ccf41504ab27d93464e555b363ef406a')
b2sums=('f8b92bfe2b48cf70c50532ab837b13924006632d4265f4382ccc4609bcd9ea2fc0495fe4a2bb42a124482ed867444684272b235533bf2c367c6703b93854f0ca')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
