# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowMap
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Mapping cell populations in flow cytometry data for cross-sample comparisons using the Friedman-Rafsky Test"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-abind
  r-ade4
  r-doparallel
  r-reshape2
  r-scales
)
optdepends=(
  r-biocstyle
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('81378fb36f4684076c2dc7e4b33f8e2d')
b2sums=('d0808015bf6b60f6cb9e85d1cc2dbfa00fa311c444ad2081fe2a420a7d134104be8fbda140cc3ee708d023c5eb1273cd99e0121b8f56c0a80c3227c852e52ecd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
