# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: wagnerflo <florian@wagner-flo.net>
# Contributor: Matt Frichtl <frichtlm@gmail.com>

_cranname=plyr
_cranver=1.8.6
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Tools for Splitting, Applying and Combining Data"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=3.1.0' 'r-rcpp>=0.11.0')
optdepends=(r-abind r-covr r-doparallel r-foreach r-iterators r-itertools r-testthat)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('ea55d26f155443e9774769531daa5d4c20a0697bb53abd832e891b126c935287')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
