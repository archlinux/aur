# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>
_cranname=cAIC4
_cranver=1.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Provides functions for the estimation of the conditional Akaike information in generalized mixed-effect models fitted with (g)lmer() from 'lme4', lme() from 'nlme' and gamm() from 'mgcv'."
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=(
    r
    r-lme4
    r-matrix
    r-methods
    r-mgcv
    r-mvtnorm
    r-nlme
    r-rlrsim
    r-stats4
)
makedepends=()
optdepends=(r-gamm4)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('8f416289ec6daccb0820a0638f461f335cf49ddfcf815bef9f3c09f0c01be7e1')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
