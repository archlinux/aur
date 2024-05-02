# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SLqPCR
_pkgver=1.70.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Functions for analysis of real-time quantitative PCR data at SIRS-Lab GmbH"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-rcolorbrewer
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('64b2fd2c22ed2f7b6a1dc38cb67cce5e')
b2sums=('deb2d4860e010042bcb41a0a97dc2d39f84f2f11f0169fc4c9d5d3113920669ec529cee0c0d0a6130c333fdd4f9bc0118e59ba4190654fd3e2d515bb22db6494')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
