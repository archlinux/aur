# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_cranname=gtable
_cranver=0.3.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Arrange 'Grobs' in Tables"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2)
depends=('r>=3.0')
optdepends=(r-covr r-testthat r-knitr r-rmarkdown r-ggplot2 r-profvis)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('f996c5aa07b0ddaa52dc3a22bf3b2c99')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
