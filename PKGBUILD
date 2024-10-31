# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miRBaseConverter
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A comprehensive and high-efficiency tool for converting and retrieving the information of miRNAs in different miRBase versions"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-rmarkdown
  r-rtracklayer
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1be1455324a0b495727373e719e29026')
b2sums=('67ae1a362c89586bea36fa1d74c5df20a32413d5568f794522861728f7740df53747a46e55c5f11b5a80857f58a1e2d841a1da655e4cbbee52ef3710ad191c9c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
