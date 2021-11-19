# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=Ckmeans.1d.dp
_cranver=4.3.3
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Optimal, Fast, and Reproducible Univariate Clustering"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(LGPL3)
depends=(r r-rcpp 'r-rdpack>=0.6.1')
optdepends=(r-testthat r-knitr r-rmarkdown)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('a6145ed6c56a95641be30037b89208d9fa683855beaf960396ecd3fb76d5084c')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
