# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=similaRpeak
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Metrics to estimate a level of similarity between two ChIP-Seq profiles"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-r6
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-genomicalignments
  r-knitr
  r-rmarkdown
  r-rsamtools
  r-rtracklayer
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ade3270bc5a409fb698a562dfaf3731c')
b2sums=('f3054260aa86d34fd56b937142b99eedf6a7ceee3dbd0b84e9b8f48e6db5743603449f8bd6ebcabff2e862a1777968a24b56b133346c38f90fa3771383afae18')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
