# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=missMDA
_pkgver=1.18
pkgname=r-${_pkgname,,}
pkgver=1.18
pkgrel=3
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
sha256sums=('a522ba7dd42c9b01dc97317ee46d0084942168b7d2da7162d33357e01382f7e8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
