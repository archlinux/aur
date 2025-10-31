# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TargetScore
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Infer microRNA targets using microRNA-overexpression data and sequence information"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-pracma
)
optdepends=(
  r-biobase
  r-geoquery
  r-gplots
  r-targetscoredata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4a9ead8a97577086a52660386e3b6262')
b2sums=('e70f483fe3bb6c0e43b1feaec76d0204ff95c9f148d06488532424c9f7772da3eff0806539144b89e8b23a1148c2f3711075195cac2fb1976af1da4cbaa4e2f7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
