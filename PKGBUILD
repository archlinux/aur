# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AMOUNTAIN
_pkgver=1.38.0
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
md5sums=('b92e9f22a39dba23d742dbd49337da67')
b2sums=('3eb584d7b51a17896c01fef2054009fe54aeaf99f0fdbc1f7b55484eabc9b4905fe448f26cbe9debc1ec96f4d90e345d9304fa887ccad804a6e30819583f997f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
