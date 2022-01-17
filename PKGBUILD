# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=lambda.r
_cranver=1.2.4
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Modeling Data with Functional Programming"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(LGPL3)
depends=('r>=3.0.0' r-formatr)
optdepends=(r-testit)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('d252fee39065326c6d9f45ad798076522cec05e73b8905c1b30f95a61f7801d6')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
