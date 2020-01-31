# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_cranname=utf8
_cranver=1.1.4
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Unicode Text Processing"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(Apache2.0)
depends=('r>=2.10')
makedepends=(gcc)
optdepends=(r-knitr r-rmarkdown r-testthat)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('33de0b2841c49e84f8eb5a7b2a8222b8')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
