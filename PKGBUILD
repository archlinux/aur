# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HGNChelper
_pkgver=0.8.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Identify and Correct Invalid HGNC Human Gene Symbols and MGI Mouse Gene Symbols"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('45d4542ac3250350b96c3c9506acffcc')
b2sums=('d32cefe15711f65345af36f085455d590a696f676f786f02b5c10caae101be3803f8d4852a7bca5a67cc6fdc81d6be0f4bf18b7d69ab7dcb68efdd9095d25dde')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
