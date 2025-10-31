# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IMPCdata
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Retrieves data from IMPC database"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Apache-2.0')
depends=(
  r-rjson
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1cb38c3610f5fa83120e6e76a17e99d8')
b2sums=('00bbf3378da53c5842a7c9a9dc851d88d99e9fc43a7e61915c041d2d30121d33ded2f003269d2a126f64020979b6faddd2ebf3453b914f742a13611240d0a5fe')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
