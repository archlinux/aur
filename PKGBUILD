# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=lintr
_cranver=2.0.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A 'Linter' for R Code"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=3.2' r-rex r-crayon r-cyclocomp 'r-testthat>=2.2.1' r-digest 'r-rstudioapi>=0.2' 'r-httr>=1.2.1' r-jsonlite r-knitr 'r-xml2>=1.0.0' 'r-xmlparsedata>=1.0.3')
optdepends=(r-rmarkdown r-mockery)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('fe0723757b653ef83ec7a5005d0a7524cd917d646d35a5627ee639158881ce93')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
