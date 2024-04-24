# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=hash
_pkgver=2.2.6.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Full Featured Implementation of Hash Tables/Associative Arrays/Dictionaries"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('69665bf3e3706b0186b585a3537878d2')
b2sums=('200acb8a70c1739f73fa729909a7723b7e4f9ed16e7d338112c11562edaf68639f02a028b342f8bd8dbbcf56cf22db9670758feac9e23789f1981a5a462f23be')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
