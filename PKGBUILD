# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Icens
_pkgver=1.84.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="NPMLE for Censored and Truncated Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bf5e52a73cac7153eba8e09c1c9f3026')
b2sums=('f2faa014944650ef87215a518e669f5236191c3b76df95e5659dd0d6de72fd21ae5c8a5b005209f1d9863e1535ac6f5e053c5d75ad8214790c72f368fc46d877')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
