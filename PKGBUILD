# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rRDP
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interface to the RDP Classifier"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only AND Apache-2.0 AND LGPL-2.1-only')
depends=(
  java-runtime
  r-biostrings
  r-rjava
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-rrdpdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c5a717da1389a34ff60abbaafe0c2e95')
b2sums=('d789e17be4dc87fe772643c0f33ecd2dbb7a452883cd4a5662d2446281e8df9c35ea9525e070f166c8b61962a1bbe66cd0bf80c80e235edaafde161905915833')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
