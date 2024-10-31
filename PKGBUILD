# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=calm
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Covariate Assisted Large-scale Multiple testing"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9fe2eb9aa8aa3db12074fee808438ef0')
b2sums=('4af80c98b9bc27d4972575434f69c0e5e4c408aa1469c98234e0750423b42fe6d88e30b7aef57adc51195175589ffa5326768f289be2db6ef4b02095c73f198d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
