# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gggenes
_pkgver=0.5.1
pkgname=r-${_pkgname,,}
pkgver=0.5.1
pkgrel=1
pkgdesc="Draw Gene Arrow Maps in 'ggplot2'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggfittext
  r-ggplot2
  r-rlang
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-spelling
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('72c9fb0aacb7f9341f5eb71dbe983076723d2e6aab556789d173fc2926744023')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
