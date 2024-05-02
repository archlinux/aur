# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=antiProfiles
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Implementation of gene expression anti-profiles"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-locfit
  r-matrixstats
)
optdepends=(
  r-antiprofilesdata
  r-rcolorbrewer
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('88087570597d3b4dd093f8f39ab39d16')
b2sums=('30b66c1ca76e3ee525ec323a50af552f13e59d256ad4fdd68f4d306ebf4ff5990bd021a0b9b4a9f927215ca35a4c985c36cdb6c5ab1167615348764343a04eba')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
