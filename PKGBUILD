# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=countrycode
_pkgver=1.9.0
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
  r-eurostat
  r-isocodes
  r-pkgsite
  r-testthat
  r-tibble
  r-yaml
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('926ed05d1538df48347d517a742f9a9a')
b2sums=('0a643c5e32539461f0b317ccbba65032a1d48ecb69bed4bb402a61d9aaee24971adfcda8b7fa5182ff8fec6f7bfb29b5c2fedcbccfa68754cf6792da1ce6333d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
