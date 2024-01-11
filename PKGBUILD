# Maintainer: Alexander Bocken <alexander@bocken.org>

_cranname=fdapace
_cranver=0.5.9
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Functional Data Analysis and Empirical Dynamics"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(BSD)
depends=('r-rcpp>=0.11.5' 'r-rcppeigen' r-hmisc r-mass r-matrix r-pracma r-numderiv)
optdepends=(r-plot3d r-rgl r-aplpack r-mgcv r-ks r-gtools r-knitr r-rmarkdown r-emcluster r-minqa r-testthat)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=(0e41687ecd71ce74e470eceb6062812c5774d64da5d18dcbec20097f5a18479a)

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
