# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pgca
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An Algorithm to Link Protein Groups Created from MS/MS Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ec5cae8e52979d852cabb6c45123c013')
b2sums=('78e2ebe9b7670adbe0a32e3829cbad1077d05e21d2fd62f970683fb8e3f77ba26ff1b2d980d68edee102a082f9af748adf081579a779141ae0cdc57f02f25729')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
