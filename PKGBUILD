# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowMap
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1c8039dc003c35a4c0dbb45e03f7c8aa')
b2sums=('87129d33702810e692c5838e6f704f6c87dded0bf6b251763765eb4f05e2ae74f38b292e5aa15735791991d3cba9f208664176b13b6bc9ef8323b5d6a6e5970e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
