# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pairkat
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='PaIRKAT'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-compquadform
  r-data.table
  r-igraph
  r-keggrest
  r-magrittr
  r-summarizedexperiment
  r-tibble
)
optdepends=(
  r-biocstyle
  r-dplyr
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7e618b8b6022bd68cfd71ac4087372426d26f3ef56c76c24d9de94db0a15e1d7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
