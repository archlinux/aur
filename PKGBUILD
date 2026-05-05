# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=limma
_pkgver=3.68.1
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
md5sums=('53ca478773ed98f03dbb163cb673c18b')
b2sums=('1e37c61640851c48d4e68b0025f7d8b28744da02273053c68402d74f50bc3f316b6ec0a10f2929f2a16259b8be50df77ea62f3406ba97af4587f95218cbb1157')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
