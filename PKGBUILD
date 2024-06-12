# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TargetSearch
_pkgver=2.6.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A package for the analysis of GC-MS metabolite profiling data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-assertthat
  r-ncdf4
)
optdepends=(
  r-biocstyle
  r-knitr
  r-targetsearchdata
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b8359f73368ac86678ec3019e9c4ddd7')
b2sums=('a350a84c7c5999f37097913d52e36cc3302e2467fa093df2d6a73f6f6d2adeb08f7fe68b3f3efcc97ef684af6aeca5c34868ab2837038cda15c22502b0067fe4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
