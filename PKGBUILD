# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ASAFE
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Ancestry Specific Allele Frequency Estimation"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
optdepends=(
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9fa88698c5c2b76ff89b05e1eae31f70')
b2sums=('0cdf39533b3450c120920296a53206858ae43cb3d6cf20e3c29b8458dff51a97eec1824c0df1f794c834ce834247aa892c491a61d96dc97175157613d98a754a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
