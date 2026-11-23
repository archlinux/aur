# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=missMDA
_pkgver=1.23
pkgname=r-${_pkgname,,}
pkgver=1.23
pkgrel=1
pkgdesc='Handling Missing Values with Multivariate Data Analysis'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-doparallel
  r-factominer
  r-foreach
  r-ggplot2
  r-mice
  r-mvtnorm
)
optdepends=(
  r-knitr
  r-markdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6197e00ac77b5e96519d80860cd14e27ecd2b0d7f716083673faff204624690d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
