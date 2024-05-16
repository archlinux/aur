# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>
_cranname=RLRsim
_cranver=3.1-8
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Provides functions for the estimation of the conditional Akaike information in generalized mixed-effect models fitted with (g)lmer() from 'lme4', lme() from 'nlme' and gamm() from 'mgcv'."
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=(
    r
    r-rcpp
    r-lme4
    r-mgcv
    r-nlme
)
makedepends=(gcc)
optdepends=()
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('6adf1fbecf16a6118051efbb0956405770d794c33b4420b08b1d497718d5241a')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
