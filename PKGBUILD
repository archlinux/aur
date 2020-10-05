# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: frichtlm <frichtlm@gmail.com>

_cranname=readr
_cranver=1.4.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Read Rectangular Text Data"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=('r>=3.1' r-cli r-clipr r-crayon 'r-hms>=0.4.1' r-rlang r-r6 r-tibble r-lifecycle r-bh r-cpp11)
makedepends=(make)
optdepends=(r-covr r-curl r-dplyr r-knitr r-rmarkdown r-spelling r-stringi r-testthat r-xml2)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('02b1188aab8b2bc3f3d2bba5b946bd299610e87f3f7660c88b60b444093c46b9')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
