# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SAIGEgds
_pkgver=2.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Scalable Implementation of Generalized mixed models using GDS files in Phenome-Wide Association Studies"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  blas
  lapack
  r-gdsfmt
  r-rcpp
  r-rcppparallel
  r-seqarray
)
makedepends=(
  r-rcpparmadillo
)
optdepends=(
  r-biocgenerics
  r-compquadform
  r-crayon
  r-ggmanh
  r-knitr
  r-markdown
  r-rmarkdown
  r-runit
  r-snprelate
  r-survey
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1187edceb086e860386386db76896e83')
b2sums=('4088bd9e28b66232c74cc1e12291eb5799a231adfb00d7c200f161a20998552df3fb7097c3f16b88ce99cb9816f9cddfd0225af0c08171881a635e1d2037cc26')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
