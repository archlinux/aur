# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HumanTranscriptomeCompendium
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Tools to work with a Compendium of 181000 human transcriptome sequencing studies'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-s4vectors
  r-shiny
  r-ssrch
  r-summarizedexperiment
)
optdepends=(
  r-beeswarm
  r-biocfilecache
  r-biocstyle
  r-dplyr
  r-dt
  r-knitr
  r-magrittr
  r-rhdf5client
  r-rmarkdown
  r-testthat
  r-tximport
  r-tximportdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d9f340fc5992aa7510d8a4513e08891f109bc5a73eba1b2f34cea2cf3e57e62c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
