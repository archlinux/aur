# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=limma
_pkgver=3.62.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Linear Models for Microarray and Omics Data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-statmod
)
optdepends=(
  r-affy
  r-annotationdbi
  r-biasedurn
  r-biobase
  r-biocstyle
  r-ellipse
  r-go.db
  r-gplots
  r-illuminaio
  r-knitr
  r-locfit
  r-org.hs.eg.db
  r-vsn
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('76032128ad85285ed3dfc05a73cb9b51')
b2sums=('7e9c2a6aed8bbe679ca11d5265ade7bdb5c0f1287e7979c4f78dd0c357e4b6db9f2297cd8a50945283734d8a496bb9bca93297fb161f25869f58ac8875c91698')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
