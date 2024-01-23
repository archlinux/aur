# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MALDIquant
_pkgver=1.22.2
pkgname=r-${_pkgname,,}
pkgver=1.22.2
pkgrel=1
pkgdesc='Quantitative Analysis of Mass Spectrometry Data'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-knitr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6051b07019003c698ae016d79f13945bfe2edec26f8a688126b978cb90adcfff')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
