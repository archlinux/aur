# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowDensity
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Sequential Flow Cytometry Data Gating"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-car
  r-flowcore
  r-flowviz
  r-gplots
  r-polyclip
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c2cf2f6bd4212e80840687668669f252')
b2sums=('f6ae6f83d1afde929fbae29b14b2faba50ec50d04cf9a8d00e2494018281c24a6ddcb1146e9a03c1881a2814aa4cf34c1003fcf90d1559d6c73f7800244487ea')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
