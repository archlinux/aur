# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AMOUNTAIN
_pkgver=1.34.0
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
md5sums=('9a3ad255ab557b78e7128b55a23536bd')
b2sums=('73e8f5ffadc229ef2a1b4490b1e02c045ead7aa4a002be63af4a86c85946ffbe19517ea382f6f8f45b96f731f3f0ef1097db396d457ccd62b90130c32301234c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
