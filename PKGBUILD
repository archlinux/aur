# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_cranname=withr
_cranver=2.4.3
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Run Code 'With' Temporarily Modified Global State"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=3.2.0')
optdepends=(r-callr r-covr r-dbi r-knitr r-rmarkdown r-rsqlite r-testthat)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('9bdac7459ccc6c2d599ecfd132a7f0aa68d958942d9fe7dbb0442c9eda129d4c')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
