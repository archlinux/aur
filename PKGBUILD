# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=waldo
_cranver=0.3.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Find Differences Between R Objects"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=(r r-cli 'r-diffobj>=0.3.4' r-fansi r-glue r-rematch2 'r-rlang>=0.4.10' r-tibble)
optdepends=(r-testthat r-covr r-r6 r-withr r-xml2)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('ec2c8c1afbc413f8db8b6b0c6970194a875f616ad18e1e72a004bc4497ec019b')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
