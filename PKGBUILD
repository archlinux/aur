# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=VarfromPDB
_pkgver=2.2.10
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Disease-Gene-Variant Relations Mining from the Public Databases and Literature"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-curl
  r-rismed
  r-stringi
  r-stringr
  r-xml
  r-xml2r
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/Archive/$_pkgname/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b7c92586fba4a698d4b488ba35eb2fbe')
b2sums=('f3054e4bc1edd0f38be3ee4d909385352796404076df3fa478314ae84a68f48a196646739c3f08ebe22d7a3b532e5d1161110bba0e1b525d357fdd85a719638a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
