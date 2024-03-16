# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gscreend
_pkgver=1.16.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Analysis of pooled genetic screens"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocparallel
  r-fgarch
  r-nloptr
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('37387e3427e8079e45abb8db9de731ad')
b2sums=('67ff9c81999aa42442012702611f4f491d984d4d19761090dad3f6410c73e972042b2b0a27cc8588144a7a8cfded917d9c3cc7004bca4c1f1544d19fe4685746')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
