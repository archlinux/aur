# Maintainer: Alexander Bocken <alexander@bocken.org>

_cranname=sde
_cranver=2.0.18
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Simulation and Inference for Stochastic Differential Equations"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(LGPL3)
depends=(r r-mass r-stats4 r-fda r-zoo)
optdepends=()
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=(8876a9a67ef2a19d4200b9aaf5ae3bd7d0e920f3e3291bf58d2e88aa14e669e6)

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
