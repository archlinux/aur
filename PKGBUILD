# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=datawizard
_pkgver=0.6.3
pkgname=r-${_pkgname,,}
pkgver=0.6.3
pkgrel=1
pkgdesc='Easy Data Wrangling'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-insight
)
optdepends=(
  r-bayestestr
  r-boot
  r-effectsize
  r-gamm4
  r-ggplot2
  r-knitr
  r-lme4
  r-mass
  r-modelbased
  r-parameters
  r-poorman
  r-psych
  r-rmarkdown
  r-rstanarm
  r-see
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('279afa654e7f661ee428412b909aa1f74fcc592eff0640da18831227698fc932')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
