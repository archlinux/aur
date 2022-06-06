# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Dune
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='Improving replicability in single-cell RNA-Seq cell type discovery'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-aricode
  r-biocparallel
  r-dplyr
  r-gganimate
  r-ggplot2
  r-magrittr
  r-purrr
  r-rcolorbrewer
  r-summarizedexperiment
  r-tidyr
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ec2e7ff1126b5f2c99d7fc1721e80911e3e8bb53628d45d73e532008a55c7075')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
