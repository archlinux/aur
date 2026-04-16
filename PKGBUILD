# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=countrycode
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Convert Country Names and Country Codes"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-altdoc
  r-eurostat
  r-isocodes
  r-testthat
  r-tibble
  r-utf8
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d3821db67468fe524b448f216d092850')
b2sums=('5ac1aa442eb3ae5b5b59a443bdf445c2c706d608055c27a35b7bb153cfe0655a4abc6fcf6e1cbf9cafec7c46d5489be7cd40bdc17889b49b6f301840d4f8e097')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
