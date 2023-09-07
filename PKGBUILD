#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspMetaAnalysis
_pkgver=0.18.0
pkgname=r-${_pkgname,,}
pkgver=0.18.0
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
)
groups=(r-jasp r-jaspextra)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('627b95efe59b093de9b11bf4fc3b83461cea8a0bda1dc4602dcb7e57f428cb66')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
