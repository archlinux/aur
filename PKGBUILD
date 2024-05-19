# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HGNChelper
_pkgver=0.8.14
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Identify and Correct Invalid HGNC Human Gene Symbols and MGI Mouse Gene Symbols"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-splitstackshape
)
optdepends=(
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b5f3acc9de7700bc7c3a95b2d0023286')
b2sums=('03a2d06e8c79519dc73dc295beb252d18fdd8bbe9dee201bcc43fcf64e5f3a7fdd1ea027d3c2595ccc20fd00fb13bb96a3ccf78bd93c9a490f01797b8fe9404c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
