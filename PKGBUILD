# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OnassisJavaLibs
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="java libraries to run conceptmapper and semantic similarity"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-rjava
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('835d47c58d358149eaf643a280345200')
b2sums=('4316cdd112dbd4f44d5d4e2a775650b6d636ae5f7d505b6ca3be31d08980384cb09fb618bb0376f164eb10b5666eb992c2da977628e791978755bb545a67aa50')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
