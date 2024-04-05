# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spikeLI
_pkgver=2.62.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Affymetrix Spike-in Langmuir Isotherm Data Analysis Tool"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('15e5851707938b83c34b9d5667d62f79')
b2sums=('401ec3b0941ba19137029b8dbd2feefa1d4305c4fefd2f6408c841be3f66911cc199edb05a1353b88fc9f5951816ee12481865b80ae902920b3635c5976cf5eb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
