# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=enrichR
_pkgver=3.2
pkgname=r-${_pkgname,,}
pkgver=3.2
pkgrel=1
pkgdesc="Provides an R Interface to 'Enrichr'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-curl
  r-ggplot2
  r-httr
  r-rjson
  r-writexls
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('612a9ba5a50277d93dad7850f9c620116745971e6404e305a0626d8eb7c127bd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
