# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DNAcopy
_pkgver=1.88.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="DNA Copy Number Data Analysis"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8c19f2cf9d4d793353a9da8aa94b961b')
b2sums=('8e691a942fcfa432e3ff9c7ecc6729b0fb8db7ae45cdb3a45281a083e7e5f2c2736aed36184666afae3a6d0a9344e5014fbc349b637ca1439a8ca4a5103dda04')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
