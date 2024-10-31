# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SAIGEgds
_pkgver=2.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Scalable Implementation of Generalized mixed models using GDS files in Phenome-Wide Association Studies"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  blas
  lapack
  onetbb
  r-compquadform
  r-gdsfmt
  r-rcpp
  r-rcppparallel
  r-seqarray
  r-survey
)
makedepends=(
  r-rcpparmadillo
)
optdepends=(
  r-biocgenerics
  r-crayon
  r-ggmanh
  r-knitr
  r-markdown
  r-rmarkdown
  r-runit
  r-snprelate
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6b3e2939d8ff51b9b7199227dabd6c73')
b2sums=('653679fe32c15e2c8a631d3fdbb2b59f95af7ead5783cf3c97f5196d354f640b3c57a70e1aa72a8507463c9f0581bb5b08621c367b6f4cef2faeaabf5b601877')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
