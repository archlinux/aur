# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ARRmData
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Example dataset for normalization of Illumina 450k Methylation data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('08a65596c3798189da04d938956f34a2')
b2sums=('cab5afa2ac1be89cf7600723379b0b11a48ccee5f5faab0b6c12e21c5bd77cfb69126f9a588c94b1d85351400de6488dd86222043b32497d16cbc454e9ec3b42')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
