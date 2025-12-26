# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rRDP
_pkgver=1.44.0
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
md5sums=('0c204596aa38308b1012464818517f62')
b2sums=('46fdf3d38ba9b8149697d17fa43935d25b5763c51b50f5793af24cf38a26644ca634233ea9c0fc0fb5e6b08937da4572ef5adf60c6798e74f30e20fa71a9ba78')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
