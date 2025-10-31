# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=parody
_pkgver=1.68.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Parametric And Resistant Outlier DYtection"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('575685b4a3919c86c310258f504951be')
b2sums=('144d4259a5d36a7e0b823191fdb77fa3ea1c5655a753d471c64d0deff1120a0b8887c9f7f77bee4f8e2221292d69361e30e519889ea842c609f1e6faab6a1d63')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
