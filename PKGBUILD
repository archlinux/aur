# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miRcomp
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools to assess and compare miRNA expression estimatation methods"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r-biobase
  r-mircompdata
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-runit
  r-shiny
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b78817cc16a243c02adbe66bae6e61f1')
b2sums=('f17693eac5e6e4042bb250f96992e94b12b1828649de1c0ec3074ff2ef79354188607b5d152a50a9b65ec808035ae6b5092a7c9a752283fede2fe3c6bdfb202c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
