# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AMOUNTAIN
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Active modules for multilayer weighted gene co-expression networks: a continuous optimization approach"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  cblas
  r
)
makedepends=(
  gsl
)
optdepends=(
  r-biocstyle
  r-knitr
  r-qgraph
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7c1d2a6ea5ea79a745fa9b4d03fa1e91')
b2sums=('3a47b8a7b17ace515f7cd65865ebba8de15f411c6f2d999d6d0e08f1f4a2bf7fe0bc9b9b02643360ff5a8d7d53c404f96e7d692ae42137014af9489c00dc4351')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
