#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspMetaAnalysis
_pkgver=0.95.3
pkgname=r-${_pkgname,,}
pkgver=0.95.3
pkgrel=1
pkgdesc="Meta-Analysis Module for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
  r-dplyr
  r-ggplot2
  r-jaspbase
  r-jaspgraphs
  r-jaspsem
  r-metasem
  r-mass
  r-metabma
  r-metafor
  r-pema
  r-psych
  r-purrr
  r-rstan
  r-stringr
  r-tibble
  r-tidyr
  r-weightr
  r-bayestools
  r-robma
  r-metamisc
  r-ggmcmc
  r-clubsandwich
  r-compquadform
  r-sp
  r-dfoptim
  r-nleqslv
  r-patchwork
)
groups=(r-jasp r-jaspextra)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('30edc46d5b9aa03d58e173e7b88ec405fb83a8603ddfcdb7cf899115e8a0c0a9')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
