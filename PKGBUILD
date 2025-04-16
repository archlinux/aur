# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pgca
_pkgver=1.32.0
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
md5sums=('adbc99f3265bfad731f57185ee120dec')
b2sums=('3610ab73817d30baf2c0b61c2edc83dd129e7d4bd2157a9229855aab698d2f1377e9a1f7ddfbf9b4bffc62d4296d43682bcbe58cae3d50b4a0a4579324fcca11')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
