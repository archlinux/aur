# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rcellminerData
_pkgver=2.28.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Molecular Profiles and Drug Response for the NCI-60 Cell Lines"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r-biobase
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rcellminer
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bd3a4c4313595d2fdff46bcbafd61eca')
b2sums=('90379d90568e146c47ad0247c217d781b54c3c675eb0ccabb3b4c3ba1c4765324f9840fce27f8c1e6853660bf01022aac34fdaa47cda9bcae496400fdb91d230')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
