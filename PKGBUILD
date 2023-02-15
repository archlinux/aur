#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspQualityControl
_pkgver=0.17.1
pkgname=r-${_pkgname,,}
pkgver=0.17.1
pkgrel=1
pkgdesc="Quality Control Module for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
replaces=('r-jaspprocesscontrol')
depends=(r
  r-doe.base
  r-fitdistrplus
  r-frf2
  r-ggplot2
  r-ggrepel
  r-goftest
  r-irr
  r-jaspbase
  r-jaspdescriptives
  r-jaspgraphs
  r-mle.tools
  r-psych
  r-qcc
  r-rsm
  r-rspc
  r-tidyr
  r-cowplot
  r-vipor
  r-ggpp
  r-tibble
  r-envstats
  r-fadist
  r-daewr
  r-desirability
  r-weibullness
  r-car
)
groups=(r-jasp r-jaspextra)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('ff60cc2f6facb7b09b893995f02affeb100b957041d10c713c412e0e9bfed30c')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
