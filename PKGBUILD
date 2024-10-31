# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SLqPCR
_pkgver=1.72.0
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
md5sums=('7bf08a56b19db7f31c3c36e65a760b98')
b2sums=('1e7b6541eb857a253ae0a67315db2e11ff6a642d0a547d5b8fa5770f5365b9e109f6086de7cf10fc352c57fa8b2c14e725c5741ac3591816c140ce01657eb518')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
