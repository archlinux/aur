# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CancerSubtypes
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Cancer subtypes identification, validation and visualization based on multiple genomic data sets"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-consensusclusterplus
  r-impute
  r-limma
  r-nmf
  r-sigclust
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-rmarkdown
  r-rtcga.mrna
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('60441ccfd99126a3727c0621d087d526')
b2sums=('20e321bbad6b017f1a9916df6844d37b5cf500173fe38e2cccfa136728f913e966271933d2c646e666fbb0de3d3f4a7d9c7025a22bfdf8812594c99bfe3ea702')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
