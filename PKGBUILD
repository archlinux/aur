# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>

_cranname=mcmcse
_cranver=1.5-0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Provides tools for computing Monte Carlo standard errors (MCSE) in Markov chain Monte Carlo (MCMC) settings."
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=(
    r
    r-ellipse
    r-fftwtools
    r-testthat
)
makedepends=(gcc)
optdepends=(
    r-knittr
    )
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('4a820dc22c48efd32b7f9d1e1b897b4b3f165cd64b2ff85ba7029621cf9e7463')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
