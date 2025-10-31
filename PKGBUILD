# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fmrs
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('8f3867cc9b54ab80e3ad14fff604985e')
b2sums=('4cad2242d80ad1ab6365dbca786dc900da4ebd3a07eed4897116afc03eba880439d9a8af31e0a9349553120849b3bc9daa0aa680b4cec9817f68529186033c00')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
