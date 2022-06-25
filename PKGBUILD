# Maintainer: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=lintr
_cranver=3.0.0
_updatedate=2022-06-25
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A 'Linter' for R Code"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=3.2' r-rex r-crayon r-cyclocomp 'r-testthat>=2.2.1' r-digest 'r-rstudioapi>=0.2' 'r-httr>=1.2.1' r-jsonlite r-knitr 'r-xml2>=1.0.0' 'r-xmlparsedata>=1.0.3')
optdepends=(r-rmarkdown r-mockery)
source=("https://cran.microsoft.com/snapshot/${_updatedate}/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('eeb1d428748311727b0453c6e6b0df2dbf5c15e35c6db1bef7f8d6ac94b177b4')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
