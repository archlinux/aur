# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iASeq
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="integrating multiple sequencing datasets for detecting allele-specific events"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3086632b16254c5b1f22c4f376bd43a7')
b2sums=('9c61497d515671c501d808184d8d64e6ef5d204f6d6ea24e25f4e36d8004dde49cbfadcdd62aa63122041035e9907e56876304f05b7b92dba579e527d5a800e9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
