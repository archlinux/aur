# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=geneClassifiers
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Application of gene classifiers"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
  r-biocgenerics
)
optdepends=(
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('237032d0dffde4694d5de463536ec1f5')
b2sums=('fdf6a5d5ebc48a7cb132fcff573b72e65826b7f447bab90a86af71ddb13af62e4cdd2160cae8b9b4b50d832fa0f019f39e7c5867111a657c30661765eec4e0c2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
