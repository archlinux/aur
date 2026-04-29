# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=affyio
_pkgver=1.82.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools for parsing Affymetrix data files"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
  zlib
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4864c8ca59b42938b313c995e6760156')
b2sums=('282bb6253d2485acb014abce7da15ff80fef1233f2a8b1ec6e0e6a76ea3890c970573fbb47206d2752d8f7882fd8e1073ab580e5a76758cd0579dc698e35ac29')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
