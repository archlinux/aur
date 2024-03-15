# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RGMQLlib
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="java libraries to run GMQL scala API"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d8ad27b1fe0c5eff6135285db972cab2')
b2sums=('1a587febdadde7829d62a07953392f87832ab6c927d5eb835a8d3919b5b5cd2def82666e1b7700340f2dd6ac62aa9a2669cc2121fe0e723ac4e9d7de498365cc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
