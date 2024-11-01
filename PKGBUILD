# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seq2pathway.data
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="data set for R package seq2pathway"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('56fcfc87bf877f64ff1283275f37ab73')
b2sums=('726f465022c98146e4650157b3ca199aafe313174d6bff1d19d3b39bcfcbf1343987460243b781d6001eedfad24edff1a99c7da22167612e4cb3a840ef0720c9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
